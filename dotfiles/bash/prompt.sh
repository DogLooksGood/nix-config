__bash_prompt() {
    color_escape() {
        echo "\[\033[38;5;$1m\]"
    }

    build() {
        local colors=("$@")
        local colors_len=${#colors[@]}
        local w=$(dirs +0)
        local len=$(expr ${#USER} + ${#HOSTNAME} + ${#w} + 5)
        local origin="[$USER@$HOSTNAME:$(dirs +0)]$"
        local origin_len=${#origin}
        local seglen=$(( ( origin_len + 7 ) / $colors_len ))
        local ps1=''
        for (( i=0; i<$colors_len; i++ )); do
            local clr=${colors[i]}
            local start=$(( i * seglen ))
            local seg=${origin:$start:$seglen}
            ps1="$ps1$(color_escape $clr)$seg"
        done
        echo "$ps1\[\033[0m\] "
    }

    if [[ -n $IN_NIX_SHELL ]]; then
        export PS1="$(build 208 209 210 211 212 213 177 141 105 69)"
    else
        export PS1="$(build 184 148 112 76 40 41 42 43 44 45)"
    fi
}
