
alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=always'
export PS1='\[[1m[33m\]\u\[[32m\]@\[[33m\]\h:\[[32m\]\w \[[33m\]\$ \[[32m\]\[[m\]'

if [ $HOSTNAME == 'work' ]
then
    source /opt/intel/bin/ifortvars.sh  ia32 
    source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh

    export PATH=$PATH:/work/lib/OmniVor_lib/fortran/_bin/linux-ia32
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

    export OMNIVOR_MKF_DIR='/work/lib/OmniVor_lib/fortran/_includes/'
    export OMNIVOR_LIB_DIR='/work/lib/OmniVor_lib/fortran/'
    export OMNIVOR_OBJ_DIR='/work/lib/OmniVor_lib/fortran/'



    #export PS1='\[\033[1m\]\[\033[1;33m\]\u:\[\e[32;1m\]\w \[\e[33;1m\]\$\[\033[m\] '
    #export PS1="\033[33;40m[\u@\h \w]\\$\007 \033[0m\007"
    #export PS1='\[\033[33;40m\][\u@\h \[\e[33;40m\]\w]\[\e[33;1m\]\$\[\033[m\] '

elif [ $HOSTNAME == 'g-000.risoe.dk' ]
then
    echo "gorm"
    alias ls='ls -F --color=always '
elif [ $HOSTNAME == 'hpc-fe1' ]
then
    echo "hpc"
    alias gonodeX='qrsh -q mic_interactive-X'
    alias gonode='qrsh -q mic_interactive '

elif [ $HOSTNAME == 'n-62-28-19' ]
then
    echo "hpc node"
    source /opt/intel/2013.0.028/bin/ifortvars.sh intel64
    source /opt/intel/2013.0.028/vtune_amplifier_xe_2013/amplxe-vars.sh
elif [ $HOSTNAME == 'gray1' ]
then
    echo "gray1"
    alias ls='ls -F  '


else
    echo "No bashrc specific commands for this hosts."
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


