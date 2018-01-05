#!/usr/bin/env bash

if [ -f "~/.gitconfig" ]; then
    rm ~/.gitconfig
fi

GITSETTINGS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $GITSETTINGS_PATH/gitconfig ~/.gitconfig

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

bashinst "export GITSETTINGS_PATH=$GITSETTINGS_PATH" "Git Settings Path";
bashinst "source $GITSETTINGS_PATH/data.sh" "Git Settings Data";
