#!/bin/sh

set -e

TARGET=$1

case "$TARGET" in
    nixos)
        nixos-rebuild switch --use-remote-sudo --impure --flake .
        ;;
    home-manager)
        home-manager switch --flake . -b backup
        ;;
esac
