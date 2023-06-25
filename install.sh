#!/bin/bash

SCRIPTS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )" && pwd )"

rm -f ~/.gitconfig
ln -s $SCRIPTS_PATH/gitconfig ~/.gitconfig

get_config_path() {
  case $SHELL in
  */zsh)
     if [ -f ~/.zprofile ]
        then
           echo ".zprofile";
        elif [ -f ~/.zshrc ]
        then
           echo ".zshrc";
        else
           echo "Can't find zsh config file";
           exit 1;
        fi
     ;;
  */bash)
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
           echo "Can't find bash config file";
           exit 1;
        fi
     ;;
  *)
    echo "Unknown shell";
    exit 1;
  esac
}

if grep -q "GITSETTINGS_PATH" ~/$(get_config_path);
then
    echo "Scripts already installed."
    exit 0;
fi;

tee -a ~/$(get_config_path) >/dev/null <<EOF

# Git Settings
export GITSETTINGS_PATH=$SCRIPTS_PATH

if [ ! -f ~/.gitconfig ]
  then
     ln -s $GITSETTINGS_PATH/gitconfig ~/.gitconfig;
  fi

source $SCRIPTS_PATH/data.sh
EOF

exec $SHELL -l
