
export PYTHONPATH="$PYTHONPATH:$HOME/Config/path/PythonPath"
# export PATH="$PATH:$HOME/Config/scrits"

alias ls='ls -F --color=always --group-directories-first'
# alias grep='grep --color=always'
alias grep='grep --color=auto'
export PS1='\[[1m[33m\]\u\[[32m\]@\[[33m\]\h:\[[32m\]\w \[[33m\]\$ \[[32m\]\[[m\]'

if [ $HOSTNAME == 'work' ]
then

    export PS1='\[[1m[33m\]\u\[[32m\]@\[[33m\]\h:\[[32m\]\w `whichBranch`\[[33m\]\$ \[[32m\]\[[m\]'

    source /opt/intel/bin/compilervars.sh intel64
    alias vtune='source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh'

    export PATH=$PATH:/work/lib/OmniVor_lib/fortran/_bin/linux-amd64
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
    
    export PATH=/home/manu/Work/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/home/manu/Work/cuda/lib64:$LD_LIBRARY_PATH

    export OMNIVOR_MKF_DIR='/work/lib/OmniVor_lib/fortran/_includes/'
    export OMNIVOR_LIB_DIR='/work/lib/OmniVor_lib/fortran/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR='/work/lib/OmniVor_lib/fortran/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR='/work/lib/OmniVor_lib/fortran/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR='/work/lib/OmniVor_lib/fortran/'

elif [ $HOSTNAME == 'olympe' ]
then

    source /opt/intel/bin/compilervars.sh intel64
    export PS1='\[[1m[33m\]\u\[[32m\]@\[[33m\]\h:\[[32m\]\w `whichBranch`\[[33m\]\$ \[[32m\]\[[m\]'
#    source /opt/intel/bin/compilervars.sh intel64
#    alias vtune='source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh'

#    export PATH=$PATH:/work/lib/OmniVor_lib/fortran/_bin/linux-amd64
#    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
    
#    export PATH=/home/manu/Work/cuda/bin:$PATH
#    export LD_LIBRARY_PATH=/home/manu/Work/cuda/lib64:$LD_LIBRARY_PATH

#    export OMNIVOR_MKF_DIR='/work/lib/OmniVor_lib/fortran/_includes/'
#    export OMNIVOR_LIB_DIR='/work/lib/OmniVor_lib/fortran/_lib/linux-amd64/'
#    export OMNIVOR_OBJ_DIR='/work/lib/OmniVor_lib/fortran/_build/linux-amd64/'
#    export OMNIVOR_BIN_DIR='/work/lib/OmniVor_lib/fortran/_bin/linux-amd64/'
    export OMNIVOR_MKF_DIR='/home/manu/Work-tmp/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR='/home/manu/Work-tmp/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR='/home/manu/Work-tmp/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR='/home/manu/Work-tmp/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR='/home/manu/Work-tmp/omnivor/_src/'

elif [ $HOSTNAME == 'g-000.risoe.dk' ]
then
    # GORM
    alias ls='ls -F --color=always '
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR='/home/ebra/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR='/home/ebra/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR='/home/ebra/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR='/home/ebra/omnivor/_src/'
    export PATH="/home/ebra/anaconda/bin:$PATH"

elif [ $HOSTNAME == 'jess.dtu.dk' ]
then
    # JESS
    export OMNIVOR_MKF_DIR='/home/ebra/omnivor/_src/_includes/'
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
    export OMNIVOR_MKF_DIR=$HOME'/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR=$HOME'/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR=$HOME'/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR=$HOME'/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR=$HOME'/omnivor/_src/'

elif [ $HOSTNAME == 'n-62-28-19' ]
then
    # hpc node
    #source /opt/intel/2013.0.028/bin/ifortvars.sh intel64
    alias vtune='source /opt/intel/2013.0.028/vtune_amplifier_xe_2013/amplxe-vars.sh'
    export OMNIVOR_MKF_DIR=$HOME'/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR=$HOME'/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR=$HOME'/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR=$HOME'/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR=$HOME'/omnivor/_src/'
elif [ $HOSTNAME == 'gray1' ]
then
    alias ls='ls -F  '
    export OMNIVOR_MKF_DIR=$HOME'/omnivor/_src/_includes/'
    export OMNIVOR_LIB_DIR=$HOME'/omnivor/_src/_lib/linux-amd64/'
    export OMNIVOR_OBJ_DIR=$HOME'/omnivor/_src/_build/linux-amd64/'
    export OMNIVOR_BIN_DIR=$HOME'/omnivor/_src/_bin/linux-amd64/'
    export OMNIVOR_SRC_DIR=$HOME'/omnivor/_src/'

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


