# for ubuntu
unalias l
l() {
    # if the argument is a single file or stdin is pipe
    if [[ ($# -eq 1 && -f "$1") || (-p /dev/stdin) ]]; then
        ${PAGER:-less -R} "$@"
    else
        ls --color=auto "$@"
    fi
}

h() {
    if [[ $# -gt 0 ]]; then
        history | tail -r | sort -k2 -u | sort | grep "$@"
    else
        history 50
    fi
}

alias cd='cd -P'
alias rm='rm -ir'
alias mkdir='mkdir -p'
alias up='cd ..;'
alias la='ls -laFG'
alias cl='clear'
alias g='git'
alias gdb='gdb -q'
