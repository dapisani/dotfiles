#!/bin/bash
#
# Copies config files to home directory and clones vim plugins

readonly PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
readonly PLUGIN_DIRECTORY=$HOME/.vim/pack/plugins/start

clone_repo() {
  local local_repo_location="$1"
  local repo_name="$2"
  local checkout_sha="$3"
  local remote_repo_ssh=git@github.com:$repo_name

  if [ ! -d $local_repo_location ]; then
    git clone $remote_repo_ssh $local_repo_location
    git -C $local_repo_location checkout -b last_tested $checkout_sha
  fi
}

rsync -av --exclude="*.swp" $PARENT_PATH/home/ ~/
chmod 755 ~/
clone_repo $PLUGIN_DIRECTORY/ale dense-analysis/ale.git 67d0ccc
clone_repo $PLUGIN_DIRECTORY/nerdtree scrooloose/nerdtree.git fec3e57
clone_repo $PLUGIN_DIRECTORY/completor maralla/completor.vim.git 1353ee1
clone_repo $PLUGIN_DIRECTORY/vim_wiki vimwiki/vimwiki.git 57d23fa
