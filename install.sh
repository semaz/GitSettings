#!/usr/bin/env bash

if [ -f "~/.gitconfig" ]; then
    rm ~/.gitconfig
fi

GITSETTINGS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $GITSETTINGS_PATH/gitconfig ~/.gitconfig

get_rc_path() {
  if [ -f ~/.bash_profile ]
  then
     echo ".bash_profile";
  elif [ -f ~/.bash_rc ]
  then
     echo ".bash_rc";
  elif [ -f ~/.bashrc ]
  then
     echo ".bashrc";
  else
     echo "Can't find bach config file";
     exit 1;
  fi
}

bashinst() {
    if ! grep -q "$1" ~/$(get_rc_path); then
        echo "\n# $2 \n$1" >> ~/$(get_rc_path)
    fi;
}

bashinst "export GITSETTINGS_PATH=$GITSETTINGS_PATH" "Git Settings Path";
bashinst "source $GITSETTINGS_PATH/data.sh" "Git Settings Data";
