if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export PS1="\[\e[1;32m\]\u: \[\e[1;35m\]\W\[\e[m\]\\$ "

PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
export PATH

# for brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    . $(brew --prefix)/etc/profile.d/z.sh # for z
fi

# for cabal
export PATH="$HOME/.cabal/bin/:$PATH"

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# for MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export DOCKER_HOST=tcp://localhost:4243
