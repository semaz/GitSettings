#!/usr/bin/env bash

if [ -f "$GITSETTINGS_PATH/names.sh" ]; then

    source $GITSETTINGS_PATH/names.sh

    export GIT_COMMITTER_NAME="$GIT_NAME"
    export GIT_COMMITTER_EMAIL="$GIT_EMAIL"
    export GIT_AUTHOR_NAME="$GIT_NAME"
    export GIT_AUTHOR_EMAIL="$GIT_EMAIL"

    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"

fi