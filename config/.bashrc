if [ -f ~/.aliases-for-work ]; then
    source ~/.aliases-for-work
fi

function l() {
    # if the argument is a single file or stdin is pipe
    if [[ ($# -eq 1 && -f "$1") || (-p /dev/stdin) ]]; then
        ${PAGER:-less -R} "$@"
    else
        ls -FG "$@"
    fi
}

function h() {
    if [[ $# -gt 0 ]]; then
        history | tail -r | sort -k2 -u | sort | grep "$@"
    else
        history 50
    fi
}

function cd() {
    builtin cd -P $@ && ls -FG;
}

alias rm='rm -ir'
alias mkdir='mkdir -p'
alias up='cd ..;'
alias ls='ls -FG'
alias la='ls -laFG'
alias cl='clear'
alias d='docker'
alias g='git'
alias rmbr="git branch --merged | grep -v '*' | grep -v 'master' | xargs -I % git branch -d %"
alias rmbrall="git branch | grep -v '*' | grep -v 'master' | xargs -I % git branch -D %"
alias tm='tmux'
alias be='bundle exec'
alias bi='bundle install'
alias digz='dig -tAXFR'
alias checkjdk='/usr/libexec/java_home -V'
alias checkjar='jarsigner -verify -verbose -certs'
alias r='rails'
alias br='bin/rails'
alias py='python'
alias ungron='gron --ungron'

# for stack
alias ghc="stack ghc --"
alias ghci="stack ghci"
alias runghc="stack runghc --"
alias runhaskell="stack runghc --"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# the results of history substitution are not immediately passed to the shell parser.
# Instead, the resulting line is loaded into the Readline editing buffer, allowing further modification.
shopt -s histverify

# for heroku
export PATH='/usr/local/heroku/bin:$PATH'

# for yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# for pypi
alias upypi='python setup.py sdist bdist_wheel upload'
alias rpypi='python setup.py register'

# for android
alias androidip='adb -d shell ip addr show wlan0 | egrep -o "172\.[^\. ]*.[^\. ]*\.[^\. ]*| 192\.168\.[^\. ]*\.[^\. ]*" | head -n 1'

function androidscreenshot () {
    timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
    adb shell screencap -p /data/local/tmp/screenshot-${timestamp}.png
    adb pull /data/local/tmp/screenshot-${timestamp}.png
    adb shell rm /data/local/tmp/screenshot-${timestamp}.png
}

function androidlog () {
    pidcat
}

function packagename () {
    aapt l -a $1 | grep "A: package"
}

function apkpermission () {
    aapt l -a $1 | grep -i permission
}

############
# mac only #
############
function cdf () {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        builtin cd "$target"
            pwd
    else
        echo 'No Finder window found' >&2
    fi
}

alias f='open .'
alias objcopy='gobjcopy'
alias objdump='gobjdump'
alias readelf='greadelf'
