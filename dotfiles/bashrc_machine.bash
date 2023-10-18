
# NOTE: path set in .profile
# export PYTHONPATH="$PYTHONPATH:$HOME/Config/path/PythonPath"
# export PATH="$PATH:$HOME/Config/scrits"

alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=auto'

# --------------------------------------------------------------------------------
# --- PROMPT
# --------------------------------------------------------------------------------
# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White
# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
OCHRE="\033[38;5;95m"
BLUE="\033[0;34m"
WHITE="\033[0;37m"
RESET="\033[0m"


function git_clr {
    local git_status="$(git status 2> /dev/null)"
    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $GREEN
    else
        echo -e $WHITE
    fi
}

function git_ps1 {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"
    if [[ $git_status =~ $on_branch ]]; then
        local branch_or_commit="("${BASH_REMATCH[1]}") "
    elif [[ $git_status =~ $on_commit ]]; then
        local branch_or_commit="("${BASH_REMATCH[1]}") "
    else 
        local branch_or_commit=""
    fi
    echo "$branch_or_commit"
}
export PS1="\[\$(git_clr)\]\$(git_ps1)$BYellow\u$BGreen@$BYellow\h:$BGreen\w $BYellow\$ $Color_Off"


# --------------------------------------------------------------------------------
# --- Host specific commands
# --------------------------------------------------------------------------------
if [ $HOSTNAME == 'debian' ]
then
    # nothing so far
    export PATH=$PATH

elif [ $HOSTNAME == 'work' ]
then
    source /opt/intel/bin/compilervars.sh intel64
    alias vtune='source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh'

    export PATH=$PATH:/work/lib/OmniVor/_src/_bin/linux-amd64
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
elif [ $HOSTNAME == 'olympe' ]
then

    UNAME=`uname -a |awk -F_ '{print $1}'|awk '{print $1}'`
    if [ "$UNAME" == 'CYGWIN' ] 
    then
        echo "-"$UNAME"-"
    else
        source /opt/intel/bin/compilervars.sh intel64
        export PATH=$PATH:/home/manu/Work-tmp/omnivor/_src/_bin/linux-amd64
    fi
elif [ $HOSTNAME == 'login3' ]
then
    alias ls='ls -F --group-directories-first'
elif [ $HOSTNAME == 'el1' ] || [ $HOSTNAME == 'el2' ] || [ $HOSTNAME == 'el3' ]
then
    echo "Eagle"
    alias ls='ls -F --group-directories-first --color=always'
    #export PATH="$HOME/_env/anaconda2/bin:$PATH"
    export PATH="$HOME/_env/anaconda3/bin:$PATH"
    #source activate py3



else
    alias ls='ls -F --color=always '
    echo "No bashrc specific commands for this hosts."
fi
