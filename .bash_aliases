# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

# Make the aliases complete like the commands they wrap. Requires
# git-completion.bash to be sourced before this file. (zsh completes aliases
# automatically, so .zsh-aliases needs no equivalent.)
if declare -F __git_complete >/dev/null; then
    __git_complete gs git_status
    __git_complete ga git_add
    __git_complete gb git_branch
    __git_complete gc git_commit
    __git_complete gd git_diff
    __git_complete gk gitk
    __git_complete got git
    __git_complete get git
fi
