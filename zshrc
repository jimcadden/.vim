source $HOME/.vim/profile
source $HOME/.vim/aliases

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{140}%3~%f%b %# '
RPROMPT='%*'

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

setopt SHARE_HISTORY # share history across multiple zsh sessions
setopt APPEND_HISTORY # append to history
setopt INC_APPEND_HISTORY # adds commands as they are typed, not at shell exit
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicates first
setopt HIST_IGNORE_DUPS # do not store duplications
setopt HIST_FIND_NO_DUPS #ignore duplicates when searching
setopt HIST_REDUCE_BLANKS # removes blank lines from history

#  initialize the zsh completion system
autoload -Uz compinit 

# Macvim 
if [ -d "/Applications/MacVim.app/Contents/bin/" ]; then
	export PATH=$PATH:/Applications/MacVim.app/Contents/bin/
fi

# iterm2
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
