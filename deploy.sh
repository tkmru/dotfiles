#!/bin/sh
set -eu

case "$(uname)" in
  "Darwin") ./bin/mitamae local $@ ./lib/bootstrap.rb ;;
  *)  sudo -E bin/mitamae local $@ ./lib/bootstrap.rb ;;
esac
