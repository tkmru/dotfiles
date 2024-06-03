# dotfiles
My `dotfiles` are setup and install scripts for development environment using [Mitamae](https://github.com/itamae-kitchen/mitamae) for macOS and Ubuntu.

## Installation
When running on macOS, in addition to setting up dotfiles, it install `Xcode Command Line Tools` and `Homebrew` and some tools that can be installed by Homebrew and Homebrew cask.

```
$ cd $HOME
$ git clone https://github.com/tkmru/dotfiles.git
$ cd dotfiles
$ ./init.sh 
Do you setup global .gitignore? [y/N]
y
...
Do you setup Xcode Command Line Tools? [y/N]
y
xcode-select: note: install requested for command line developer tools
Do you setup Homebrew? [y/N]
y
Do you setup some tools by Homebrew and Homebrew cask? [y/N]
y
...
```

## Update dotfiles
Use `deploy.sh`, when you add dotfiles.

```
$ ./deploy.sh
```
