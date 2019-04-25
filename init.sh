#!/bin/sh
set -eu

is_setup() {
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0 ;;
      [nN]o | 'N') return 1 ;;
      *) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}


if is_setup 'global .gitignore'; then
  if [ "$(uname)" = 'Darwin' ]; then
    curl -o ~/.gitignore -fL 'https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore'
  else
    curl -o ~/.gitignore -fL 'https://raw.githubusercontent.com/github/gitignore/master/Global/Linux.gitignore'
  fi
fi

if [ "$(uname)" = 'Darwin' ]; then
  if is_setup 'Xcode Command Line Tools'; then
    xcode-select --install
  fi

  if is_setup 'Homebrew'; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

~/dotfiles/bin/setup_mitamae.sh
~/dotfiles/deploy.sh
