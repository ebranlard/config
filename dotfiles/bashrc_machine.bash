
alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=always'
export PS1='\[[1m[33m\]\u\[[32m\]@\[[33m\]\h:\[[32m\]\w \[[33m\]\$ \[[32m\]\[[m\]'

if [ $HOSTNAME == 'work' ]
then
    source /opt/intel/bin/ifortvars.sh  ia32 
    alias vtune='source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh'

    export PATH=$PATH:/work/lib/OmniVor_lib/fortran/_bin/linux-ia32
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

    export OMNIVOR_MKF_DIR='/work/lib/OmniVor_lib/fortran/_includes/'
    export OMNIVOR_LIB_DIR='/work/lib/OmniVor_lib/fortran/_lib/linux-ia32/'
    export OMNIVOR_OBJ_DIR='/work/lib/OmniVor_lib/fortran/_build/linux-ia32/'
    export OMNIVOR_BIN_DIR='/work/lib/OmniVor_lib/fortran/_bin/linux-ia32/'
    export OMNIVOR_SRC_DIR='/work/lib/OmniVor_lib/fortran/'



    #export PS1='\[\033[1m\]\[\033[1;33m\]\u:\[\e[32;1m\]\w \[\e[33;1m\]\$\[\033[m\] '
    #export PS1="\033[33;40m[\u@\h \w]\\$\007 \033[0m\007"
    #export PS1='\[\033[33;40m\][\u@\h \[\e[33;40m\]\w]\[\e[33;1m\]\$\[\033[m\] '

elif [ $HOSTNAME == 'g-000.risoe.dk' ]
then
    # GORM
    alias ls='ls -F --color=always '
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_lib/linux-ia32/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_build/linux-ia32/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_bin/linux-ia32/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/'
elif [ $HOSTNAME == 'hpc-fe1' ]
then
    # hpc root
    alias gonodeX='qrsh -q mic_interactive-X'
    alias gonode='qrsh -q mic_interactive '
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_lib/linux-ia32/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_build/linux-ia32/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_bin/linux-ia32/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/'

elif [ $HOSTNAME == 'n-62-28-19' ]
then
    # hpc node
    source /opt/intel/2013.0.028/bin/ifortvars.sh intel64
    alias vtune='source /opt/intel/2013.0.028/vtune_amplifier_xe_2013/amplxe-vars.sh'
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_lib/linux-ia32/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_build/linux-ia32/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_bin/linux-ia32/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/'
elif [ $HOSTNAME == 'gray1' ]
then
    alias ls='ls -F  '
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_lib/linux-ia32/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_build/linux-ia32/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_bin/linux-ia32/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/'

else
    alias ls='ls -F --color=always '
    #echo "No bashrc specific commands for this hosts."
fi
# PROGRAM PATHS and VARIABLES
# export PATH=$PATH:/opt/cuda/bin/
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib/
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib/

#intel fortran
#source /opt/intel/Compiler/11.1/069/bin/ifortvars.sh  ia32 

# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib/
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/manu/Config/profiles/openGL/
# export PATH=$PATH:/opt/cuda/bin/
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib/


