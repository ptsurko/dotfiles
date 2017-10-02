#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR=~/test
DOTFILES=$DOTFILES_DIR/**/.[^.]*

function backup() {
  echo "backing up" $1
  mv -f $1 "$1"_backup
}

function symlink() {
  echo "symlinking $1 with $2"
  ln -s $2 $1
}

function install() {
  FOLDERS=$(find $DOTFILES_DIR/* -type d)
  for FOLDER in $FOLDERS; do
    if [[ -f $FOLDER/install.sh ]]; then
      sh $FOLDER/install.sh
    else
      DOTFILES=$(find $FOLDER -type f -name '.[^.]*')

      for DOTFILE in $DOTFILES; do
        DOT_FILE_NAME=$(basename $DOTFILE)
        EXISTING_DOT_FILE=$HOME_DIR/$DOT_FILE_NAME

        if [ -f $DOTFILE ]; then
          if [[ -f $EXISTING_DOT_FILE && ( ! -L $EXISTING_DOT_FILE ) ]]; then
            backup $EXISTING_DOT_FILE
          fi

          symlink $EXISTING_DOT_FILE $DOTFILE
        fi
      done

    fi
  done
}

install
