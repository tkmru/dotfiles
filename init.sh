#!/bin/sh
# based on https://github.com/akito19/dotfiles/blob/master/init.sh

set -eu

is_setup() {
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0 ;;
      [nN]o | [nN]) return 1 ;;
      *) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}


if is_setup 'global .gitignore'; then
  if [ "$(uname)" = 'Darwin' ]; then
    curl -fL 'https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore' >> ~/.gitignore 
  else
    curl -fL 'https://raw.githubusercontent.com/github/gitignore/master/Global/Linux.gitignore' >> ~/.gitignore
  fi

  echo '' >> ~/.gitignore
  echo '# VisualStudioCode' >> ~/.gitignore
  curl -fL 'https://raw.githubusercontent.com/github/gitignore/master/Global/VisualStudioCode.gitignore' >> ~/.gitignore
  echo '' >> ~/.gitignore
  echo '# Vim' >> ~/.gitignore
  curl -fL 'https://raw.githubusercontent.com/github/gitignore/master/Global/Vim.gitignore' >> ~/.gitignore
fi

if [ "$(uname)" = 'Darwin' ]; then
  if is_setup 'Xcode Command Line Tools'; then
    xcode-select --install
  fi

  if is_setup 'Homebrew'; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew doctor
  fi

  if is_setup 'some tools by Homebrew and Homebrew cask'; then
    ~/dotfiles/brew.sh
    ~/dotfiles/cask.sh
  fi
fi

if [ ! -d $HOME/dotfiles ]; then
  git clone https://github.com/tkmru/dotfiles.git ~/dotfiles
fi

echo 'Change default shell from zsh to bash'
chsh -s /bin/bash

~/dotfiles/bin/setup_mitamae.sh
~/dotfiles/deploy.sh
