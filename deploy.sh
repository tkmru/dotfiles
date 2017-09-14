#!/bin/sh
set -eu

function logging(){
    echo "> "$*
    $*
}

case "$(uname)" in
  "Darwin") ./bin/mitamae local $@ ./bootstrap.rb ;;
  *)  sudo -E bin/mitamae local $@ ./bootstrap.rb ;;
esac
