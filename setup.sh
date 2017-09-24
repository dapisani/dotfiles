#!/bin/bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

rsync -av --exclude="*.swp" $PARENT_PATH/home/. ~/

PLUGIN_DIRECTORY=$HOME/.vim/pack/plugins/start

#Clone Vim plugins
ALE_DIRECTORY=$PLUGIN_DIRECTORY/ale
if [ -d $ALE_DIRECTORY ]; then
  git -C $ALE_DIRECTORY clean -dxf
  git -C $ALE_DIRECTORY pull
else
  git clone https://github.com/w0rp/ale.git $ALE_DIRECTORY
fi

NERD_TREE_DIRECTORY=$PLUGIN_DIRECTORY/nerdtree
if [ -d $NERD_TREE_DIRECTORY ]; then
  git -C $NERD_TREE_DIRECTORY clean -dxf
  git -C $NERD_TREE_DIRECTORY pull
else
  git clone https://github.com/scrooloose/nerdtree.git $NERD_TREE_DIRECTORY
fi

COMPLETOR_DIRECTORY=$PLUGIN_DIRECTORY/completor
if [ -d $COMPLETOR_DIRECTORY ]; then
  git -C $COMPLETOR_DIRECTORY clean -dxf
  git -C $COMPLETOR_DIRECTORY pull
else
  git clone https://github.com/maralla/completor.vim.git $COMPLETOR_DIRECTORY
fi
