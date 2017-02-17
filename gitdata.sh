#!/usr/bin/env bash

GIT_CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f "$GIT_CONFIG_PATH/names.sh" ]; then

    source $GIT_CONFIG_PATH/names.sh

    export GIT_COMMITTER_NAME="$GIT_NAME"
    export GIT_COMMITTER_EMAIL="$GIT_EMAIL"
    export GIT_AUTHOR_NAME="$GIT_NAME"
    export GIT_AUTHOR_EMAIL="$GIT_EMAIL"

    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"

fi