#!/bin/sh
set -eu

if [ "$(uname)" = 'Darwin' ]; then
  ./bin/mitamae local $@ ./lib/bootstrap.rb ;

elif [ "$(uname -n)" = 'ubuntu' ]; then
  sudo -E bin/mitamae local $@ ./lib/bootstrap.rb ;
fi
