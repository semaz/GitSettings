#!/usr/bin/env bash

rm ~/.gitconfig

GIT_CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $GIT_CONFIG_PATH/gitconfig ~/.gitconfig
ln -s $GIT_CONFIG_PATH/gitignore-global ~/.git-ignore-global


bashinst(){
    if ! grep -q "$1" ~/$(get_rc_path); then
        echo "\n# $2 \n$1" >> ~/$(get_rc_path)
    fi;
}

get_rc_path(){
    if [ -f "~/.bashrc" ]; then
        echo ".bashrc"
    else
        echo ".bash_rc"
    fi
}

bashinst "source $GIT_CONFIG_PATH/gitdata.sh" "GitHub names";