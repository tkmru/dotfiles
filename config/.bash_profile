if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export PS1="\[\e[1;32m\]\u: \[\e[1;35m\]\W\[\e[m\]\\$ "

PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:~/Library/Android/sdk/platform-tools
PATH=$PATH:~/Library/Android/android-ndk-r12b
PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin
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
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# for MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# for go
export GOPATH="$HOME/go/thirdparty:$HOME/go/myproject"
export PATH="$HOME/go/thirdparty/bin:$HOME/go/myproject/bin:$PATH"

# for c, cpp
export CPATH="$CPATH:/usr/local/include"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# for nvm
export NVM_DIR="/Users/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
