source $HOME/.vim/profile
source $HOME/.vim/aliases

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Macvim 
if [ -d "/Applications/MacVim.app/Contents/bin/" ]; then
	export PATH=$PATH:/Applications/MacVim.app/Contents/bin/
fi

# iterm2
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
