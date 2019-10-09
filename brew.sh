#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

brew install bash-completion

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep

# Install programming enviroment.
brew install pyenv
brew install rbenv
brew install go

# Install network command on macOS
brew install iproute2mac
brew install inetutils

# Install md5sum, sha1sum commands on macOS
brew install md5sha1sum

# Install some security tools
brew install aircrack-ng
brew install apktool
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install exiftool
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install ideviceinstaller
brew install john
brew install knock
brew install netcat
brew install nikto
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace

# Install other useful binaries.
brew install cmake
brew install git
brew install gron
brew install imagemagick --with-webp
brew install jq
brew install lsof
brew install nasm
brew install nkf
brew install p7zip
brew install pigz
brew install sdkman
brew install the_silver_searcher
brew install tree
brew install tmux
brew install wget
brew install xz
brew install zlib

# Remove outdated versions from the cellar.
brew cleanup
