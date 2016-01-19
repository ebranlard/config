PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export HOMEMANU=/home/manu
export PATH=$PATH:$HOMEMANU/Config/scripts/
# source $HOME2"Config/dotfiles/bashrc_machine.bash"
source $HOMEMANU/"Config/dotfiles/bashrc_common.bash"
# source $HOME2"Config/bash/git-completion.bash"

alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=always'

# --------------------------------------------------------------------------------
# --- Colors 
# --------------------------------------------------------------------------------
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

export PS1="$BRed\u$BGreen@$BRed\h:$BGreen\w $BYellow\$ $Color_Off"
