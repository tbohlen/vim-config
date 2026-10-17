#! /bin/bash

# find current directory
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Appends a line to a file unless the file already contains it, so install.sh
# can be re-run without duplicating entries. Usage: append_once LINE FILE
append_once() {
    touch "$2"
    grep -qxF "$1" "$2" || echo "$1" >> "$2"
}

# remove existing files
rm "${HOME}/.vimrc"
rm "${HOME}/.dircolors"
rm -r "${HOME}/.vim"

#symlink files into place
ln -s "${DIR}/.vimrc" "${HOME}/.vimrc"
ln -s "${DIR}/.vim" "${HOME}/.vim"
ln -s "${DIR}/.dircolors" "${HOME}/.dircolors"

# Set up aliases and git completion for whichever shell is in use. Completion
# must be loaded before the aliases so bash can attach completion to them.
case "$(basename "${SHELL}")" in
    zsh)
        RC_FILE="${HOME}/.zshrc"
        ALIASES_FILE="${HOME}/.zsh-aliases"
        append_once "autoload -Uz compinit && compinit" "${RC_FILE}"
        ;;
    bash)
        RC_FILE="${HOME}/.bashrc"
        ALIASES_FILE="${HOME}/.bash_aliases"
        curl -fsSL "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" \
            -o "${HOME}/.git-completion.bash" || exit 1
        append_once "source ~/.git-completion.bash" "${RC_FILE}"
        ;;
    *)
        echo "Unsupported shell '${SHELL}'; only zsh and bash are supported." >&2
        exit 1
        ;;
esac

rm -f "${ALIASES_FILE}"
ln -s "${DIR}/$(basename "${ALIASES_FILE}")" "${ALIASES_FILE}"
append_once "source ~/$(basename "${ALIASES_FILE}")" "${RC_FILE}"

echo "Installed. Restart your shell or run: source ${RC_FILE}"
