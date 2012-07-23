#! /bin/bash

# find current directory
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# remove existing files
rm "${HOME}/.vimrc"
rm "${HOME}/.dircolors"
rm -r "${HOME}/.vim"
rm -r "${HOME}/.gitconfig"

#symlink files into place
ln -s "${DIR}/.vimrc" "${HOME}/.vimrc"
ln -s "${DIR}/.vim" "${HOME}/.vim"
ln -s "${DIR}/.dircolors" "${HOME}/.dircolors"
ln -s "${DIR}/.gitconfig" "${HOME}/.gitconfig"
