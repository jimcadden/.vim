export PATH=$HOME/usr/local/bin:$PATH
export CLICOLOR=1
export TERM=xterm-256color
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILESIZE=999999
HISTCONTROL=ignoreboth

if [ -x /usr/bin/dircolors ]; then
  alias ls='ls --color'
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  LS_COLORS=$LS_COLORS:'di=0;34:ln=35:ex=32:pi=36:so=36:or=41' ; export LS_COLORS
fi
