
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

export PS1="$BYellow\u$BGreen@$BYellow\h:$BGreen\w $BYellow\$ $Color_Off"


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
else
    alias ls='ls -F --color=always '
    echo "No bashrc specific commands for this hosts."
fi
