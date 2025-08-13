#!/bin/bash

# fuzzel-pass: A script for searching and autotyping GNU pass login credentials via fuzzel
# Version: 1.3.0
# Author: Paul H. McClelland
# Date: 2025-07-11
# License: GPL v3.0

set -euo pipefail

# Configuration
export PASSWORD_STORE_CLIP_TIME=10
shopt -s nullglob globstar

# Fast dependency check using hash
hash fuzzel pass wtype 2>/dev/null || {
    echo "Missing required commands. Please install: fuzzel, pass, wtype" >&2
    exit 1
}

# Parse action
action="type"
args=()
for arg in "$@"; do
    case "$arg" in
        -c|--copy) action="copy" ;;
        -t|--type) action="type" ;;
        *) args+=("$arg") ;;
    esac
done

# Get password store directory once
readonly prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"

# Locate and process password files
password_files=()
for f in "$prefix"/**/*.gpg; do
    rel="${f#"$prefix"/}"
    password_files+=("${rel%.gpg}")
done

# Prompt user to select a password entry
password=$(printf '%s\n' "${password_files[@]}" | fuzzel --dmenu "${args[@]}")
[[ -n "$password" ]] || exit

# Get contents of the selected entry
entry_contents=$(pass show "$password" 2>/dev/null) || exit 1

# Extract password (first line)
password_value="${entry_contents%%$'\n'*}"

# Parse metadata into an associative array
declare -A fields
fields["pass"]="$password_value"
metadata="${entry_contents#*$'\n'}"
while IFS= read -r line; do
    [[ "$line" == "---" ]] && continue
    key="${line%%:*}"
    value="${line#*:}"
    value="${value#"${value%%[![:space:]]*}"}"  # Trim leading space
    [[ -n "$key" && -n "$value" ]] && fields["$key"]="$value"
done <<< "$metadata"

# Prompt for metadata field
metadata_keys=("${!fields[@]}")
IFS=$'\n' sorted_keys=($(sort <<<"${metadata_keys[*]}"))
selection=$(printf '%s\n' "${sorted_keys[@]}" | fuzzel --dmenu --prompt "$password:" "${args[@]}")
[[ -n "$selection" ]] || exit

# Updated type_value with support for quoted strings and escaped characters
type_value() {
    local input="$1"
    local token
    local remainder="$input"
    while [[ -n "$remainder" ]]; do
        if [[ "$remainder" =~ ^\"((([^\"\\]|\\.)*))\"[[:space:]]*(.*) ]]; then
            token="${BASH_REMATCH[1]}"
            remainder="${BASH_REMATCH[4]}"
            token="${token//\\\"/\"}"
            token="${token//\\\\/\\}"
        else
            if [[ "$remainder" =~ ^(([^[:space:]\\]|\\.)+)[[:space:]]*(.*) ]]; then
                token="${BASH_REMATCH[1]}"
                remainder="${BASH_REMATCH[3]}"
                token="${token//\\ / }"
                token="${token//\\:/\:}"
                token="${token//\\\\/\\}"
            else
                token="$remainder"
                remainder=""
                token="${token//\\ / }"
                token="${token//\\:/\:}"
                token="${token//\\\\/\\}"
            fi
        fi
        if [[ "$token" == :* ]]; then
            case "$token" in
                ":tab") wtype -k tab ;;
                ":enter") wtype -k return ;;
                ":space") wtype -k space ;;
                *) wtype "$token" ;;
            esac
        elif [[ -n "${fields[$token]+set}" ]]; then
            wtype "${fields[$token]}"
        else
            wtype "$token"
        fi
    done
}

# Perform selected action
value="${fields[$selection]}"
if [[ "$action" == "copy" ]]; then
    if hash wl-copy 2>/dev/null; then
        printf '%s' "$value" | wl-copy
        hash notify-send 2>/dev/null && notify-send "Copied $selection from $password"
    else
        echo "Error: wl-copy is required for --copy mode" >&2
        exit 1
    fi
else
    type_value "$value"
    hash notify-send 2>/dev/null && notify-send "Typed $selection for $password"
fi
