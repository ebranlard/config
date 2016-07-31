
export PYTHONPATH="$PYTHONPATH:$HOME/Config/path/PythonPath"
# export PATH="$PATH:$HOME/Config/scrits"

alias ls='ls -F --color=always --group-directories-first'
# alias grep='grep --color=always'
alias grep='grep --color=auto'

# --------------------------------------------------------------------------------
# --- Colors 
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

if [ $HOSTNAME == 'dong' ]
then
    # nothing so far
    export PATH=$PATH

elif [ $HOSTNAME == 'work' ]
then
    source /opt/intel/bin/compilervars.sh intel64
    alias vtune='source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh'

    export PATH=$PATH:/work/lib/OmniVor/_src/_bin/linux-amd64
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
    
    export OMNIVOR_MKF_DIR='/work/libs/OmniVor/_src/_mkf/'
    export OMNIVOR_INC_DIR='/work/libs/OmniVor/_src/_includes/'
    export OMNIVOR_LIB_DIR='/work/libs/OmniVor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR='/work/libs/OmniVor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR='/work/libs/OmniVor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR='/work/libs/OmniVor/_src/'

elif [ $HOSTNAME == 'olympe' ]
then

    UNAME=`uname -a |awk -F_ '{print $1}'|awk '{print $1}'`
    if [ "$UNAME" == 'CYGWIN' ] 
    then
        echo "-"$UNAME"-"
    else
        source /opt/intel/bin/compilervars.sh intel64
        export PATH=$PATH:/home/manu/Work-tmp/omnivor/_src/_bin/linux-amd64

        export OMNIVOR_MKF_DIR='/work/libs/OmniVor/_src/_mkf/'
        export OMNIVOR_INC_DIR='/work/libs/OmniVor/_src/_includes/'
        export OMNIVOR_LIB_DIR='/work/libs/OmniVor/_src/_lib/linux-amd64/'
        export OMNIVOR_OBJ_DIR='/work/libs/OmniVor/_src/_build/linux-amd64/'
        export OMNIVOR_BIN_DIR='/work/libs/OmniVor/_src/_bin/linux-amd64/'
        export OMNIVOR_SRC_DIR='/work/libs/OmniVor/_src/'HS
    fi

elif [ $HOSTNAME == 'g-000.risoe.dk' ]
then
    # GORM
    alias ls='ls -F --color=always '
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_src/_mkf/'
    export OMNIVOR_INC_DIR='/home/ebra/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/_src/'
    export PATH="/home/ebra/anaconda/bin:$PATH"

elif [ $HOSTNAME == 'jess.dtu.dk' ]
then
    # JESS
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_src/_mkf/'
    export OMNIVOR_INC_DIR='/home/ebra/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/_src/'
    export PATH="/home/ebra/anaconda/bin:$PATH"
    export PATH="/home/ebra/omnivor/_bin/linux-amd64/:$PATH"

elif [ $HOSTNAME == 'hpc-fe1' ]
then
    # hpc root
    alias gonodeX='qrsh -q mic_interactive-X'
    alias gonode='qrsh -q mic_interactive '
    alias gonodecuda='qsub -I -l nodes=n-62-14-50'
    export OMNIVOR_MKF_DIR=$HOME'/omnivor/_src/_mkf/'
    export OMNIVOR_INC_DIR=$HOME'/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR=$HOME'/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR=$HOME'/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR=$HOME'/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR=$HOME'/omnivor/_src/'

elif [ $HOSTNAME == 'n-62-28-19' ]
then
    # hpc node
    #source /opt/intel/2013.0.028/bin/ifortvars.sh intel64
    alias vtune='source /opt/intel/2013.0.028/vtune_amplifier_xe_2013/amplxe-vars.sh'
    export OMNIVOR_MKF_DIR=$HOME'/omnivor/_src/_mkf/'
    export OMNIVOR_INC_DIR=$HOME'/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR=$HOME'/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR=$HOME'/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR=$HOME'/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR=$HOME'/omnivor/_src/'
elif [ $HOSTNAME == 'gray1' ]
then
    alias ls='ls -F  '
    export OMNIVOR_MKF_DIR=$HOME'/omnivor/_src/_mkf/'
    export OMNIVOR_INC_DIR=$HOME'/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR=$HOME'/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR=$HOME'/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR=$HOME'/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR=$HOME'/omnivor/_src/'

else
    alias ls='ls -F --color=always '
    echo "No bashrc specific commands for this hosts."
fi
