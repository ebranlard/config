# If not running interactively, don't do anything
[ -z "$PS1" ] && return

alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=auto'

# --------------------------------------------------------------------------------
# --- PROMPT
# --------------------------------------------------------------------------------
Color_Off='\[\e[0m\]'       # Text Reset
BBlack='\[\e[1;30m\]'       # Bold Black
BRed='\[\e[1;31m\]'         # Bold Red
BGreen='\[\e[1;32m\]'       # Bold Green
BYellow='\[\e[1;33m\]'      # Bold Yellow
BBlue='\[\e[1;34m\]'        # Bold Blue
BPurple='\[\e[1;35m\]'      # Bold Purple
BCyan='\[\e[1;36m\]'        # Bold Cyan
BWhite='\[\e[1;37m\]'       # Bold White
export PS1="(basic) $BYellow\u$BGreen@$BYellow\h:$BGreen\w $BYellow\$ $Color_Off"

#########################################################
# ALIASES
#########################################################
alias lsnoco='ls -F --color=none --group-directories-first'
alias grepnoco='grep --color=none'

# more ls aliases
alias ll='ls -lhb'
alias la='ls -lAh'    # used to have a X options as well
alias lsd='ls -l|grep drwx'
alias lad='ls -lAh|grep drwx'
alias dir='ls -1'
alias lg='git status'
alias cd..='cd ..'
alias mygrep='grep --Insri '  #silly you, you made a function f in this file that you forgot

# GIT
alias lgr='for d in `find . -name ".git"`; do   echo "processing $d ..."; git --git-dir=$d --work-tree=$d/.. status; done'

# Becasue I type wrong
alias mkae='make'
alias maek='make'

# system
alias reboot='sudo reboot'
alias df='df -hT |egrep -i "file|^/"'
alias duf='du --max-depth=1 -h '
#
function ffind {
        grep -Inrsi $1 ./*
}
#
alias f=ffind

alias busy='cat /dev/urandom | hexdump -C | grep "ca fe"'

#########################################################
# Vim related - Editing mode in Bash
#########################################################
export EDITOR='vim'
set -o vi
# ^p check for partial match in history
#  bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
#  bind -m vi-insert "\C-l":clear-screen
alias clear='printf "\033c"'
# Auto complete search in history
bind -m vi-insert "\C-k":history-search-backward
bind -m vi-insert "\C-j":history-search-forward
bind -m vi-insert "\C-p":paste-from-clipboard

#########################################################
# Vim as pager (of course not as clean as the update alternative)
#########################################################
vman() { man $* | col -b | vim -c 'set ft=man nomod nolist' -; }
alias man='vman'

#########################################################
# Bash params
#########################################################
# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignoredups
# export HISTCONTROL=ignorespace
# ... does the same as the two above
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

# configures bash to append to rather than overwrite your history file
shopt -s histappend
