#!/bin/bash

SCRIPTS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.gitconfig
ln -s $SCRIPTS_PATH/gitconfig ~/.gitconfig

get_rc_path() {
  if [ -f ~/.bash_aliases ]
  then
     echo ".bash_aliases";
  elif [ -f ~/.bash_profile ]
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

if grep -q "GITSETTINGS_PATH" ~/$(get_rc_path);
then
    echo "Scripts already installed."
    exit 0;
fi;

tee -a ~/$(get_rc_path) >/dev/null <<EOF

# Git Settings Path
export GITSETTINGS_PATH=$SCRIPTS_PATH

# Git Settings Data
source $SCRIPTS_PATH/data.sh
EOF

exec $SHELL -l
