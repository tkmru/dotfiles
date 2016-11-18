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

cd() {
    builtin cd -P $@ && ls -FG;
}

alias up='cd ..;'
alias rm='rm -ir'
alias mkdir='mkdir -p'
alias la='ls -laFG'
alias cl='clear'
alias g='git'
alias gdb='gdb -q'
alias tm='tmux'
