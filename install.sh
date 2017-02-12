#!/usr/bin/env bash

rm ~/.gitconfig
rm ~/.git-ignore-global

SCRIPTS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $SCRIPTS_PATH/gitconfig ~/.gitconfig
ln -s $SCRIPTS_PATH/.gitignore ~/.git-ignore-global