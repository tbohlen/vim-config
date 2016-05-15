#! /bin/bash

# find current directory
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# remove existing files
rm "${HOME}/.vimrc"
rm "${HOME}/.dircolors"
rm -r "${HOME}/.vim"
rm -r "${HOME}/.gitconfig"
rm "${HOME}/.bash_aliases"

#symlink files into place
ln -s "${DIR}/.vimrc" "${HOME}/.vimrc"
ln -s "${DIR}/.vim" "${HOME}/.vim"
ln -s "${DIR}/.dircolors" "${HOME}/.dircolors"
ln -s "${DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -s "${DIR}/.bash_aliases" "${HOME}/.bash_aliases"
ln -s "${DIR}/.git-completion.bash" "${HOME}/.git-completion.bash"

echo "It is up to you to load bash aliases and git-completion in your bashrc"
