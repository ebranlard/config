#########################################################
# Default
#########################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#Killing  PC BEEP
#xset -b
#setxkbmap -option compose:ralt

#########################################################
# ALIASES
#########################################################
alias lsnoco='ls -F --color=none --group-directories-first'
alias grepnoco='grep --color=none'


# more ls aliases
alias ll='ls -lhb'
alias la='ls -lAh'    # used to have a X options as well
alias lag='ls -lAgXh|grep' 
alias lsd='ls -l|grep drwx'
alias dir='ls -1'
alias lad='ls -lAh|grep drwx'
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
alias vigrub='sudo vim /boot/grub/grub.cfg'
alias vix='sudo vim /etc/X11/xorg.conf'
alias viinit='sudo vim /etc/inittab'

alias gedit='geany'
alias mydiff='diff -a -b -B -w -y -i --suppress-common-lines '
alias mydiffb='diff -a -b -B -w -y -i '
alias mywget='wget -r -l5 -k -E '
alias df='/home/manu/Config/bin/df -hT |egrep -i "file|^/"'
alias duf='du --max-depth=1 -h '
alias R='R --no-save'
alias RR='R --no-init-file'
#
function ffind {
        grep -Inrsi $1 ./*
}
#
alias f=ffind

# tracker
alias asearch='tracker-search '
alias tsearch='tracker-search -t '
alias msearch='tracker-search -m '
alias vsearch='tracker-search -v '
alias isearch='tracker-search -i '

alias lhm='xmodmap -e "pointer = 3 2 1 4 5 7 6 8 9"'
alias rhm='xmodmap -e "pointer = 1 2 3 4 5 6 7 8 9"'

#Aptitude
alias update='sudo aptitude update;sudo aptitude safe-upgrade'

if ! type "aptitude" 2> /dev/null; then
  echo "aptitude not found"
  alias api='apt-cyg install '
  alias aps='apt-cyg listall '
  alias apss='apt-cyg show '
else
    alias api='sudo aptitude install '
    alias aps='aptitude search '
    alias apss='aptitude show '
    alias apc='apt-cache policy '
fi

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
# GVIM SINGLE INSTANCE
function gv {
if [ "$#" -eq "0" ]; then
       /usr/bin/gvim --servername GVIMLOCAL      
else
        if echo "$*" | grep -q -- "--servername" ; then
        # echo "Command already has --servername use it"
        /usr/bin/gvim $*
        else
        #echo "Use default VIM server VIMLOCAL"
        /usr/bin/gvim --servername GVIMLOCAL --remote-tab-silent $*
        fi
fi
}
#alias gvim=gv
alias gvimt='gvim --remote-tab-silent'

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
# every time bash generates a fresh command prompt, it should append the last run command to the history file, and load any new commands written to that file (from other shells) into the current history list.
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
if [[ `wc -l ~/.bash_history|awk '{print $1}'`  -gt 4500 ]]; then
    echo "Time to clean your bash history, with: clean-bash-history"
fi


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi
