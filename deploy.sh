#!/bin/sh
set -eu

if [ "$(uname)" = 'Darwin' ]; then
  ./bin/mitamae local $@ ./lib/bootstrap.rb ;

elif [ "$(lsb_release -is)" = 'Ubuntu' ]; then
  sudo -E bin/mitamae local $@ ./lib/bootstrap.rb ;
fi
