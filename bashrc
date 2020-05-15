source $HOME/.vim/profile
source $HOME/.vim/aliases

export PS1="\u@\h:\W \$ "

# disable flow control
[ ! -x /bin/stty ] || stty -ixon

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

function title ()
{
    TITLE=$*;
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}
