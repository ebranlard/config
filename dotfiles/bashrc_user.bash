# Avoid loading bashrc on scp
# NOTE: the line above make it bashrc crash, which is good otherwise scp fails
if [ -z "${PS1}" ]; then
    return
fi

if [ ! -z ${BASHRC_LOADED} ]; then
    echo "Reloading bashrc";
fi

# Basic PS1 set in bashrc_basic
source $HOME"/""Config/dotfiles/bashrc_basic.bash"
source $HOME"/""Config/dotfiles/bashrc_machine.bash"
source $HOME"/""Config/dotfiles/bashrc_common.bash"

export PATH_LOC_BIN=$HOME/.local/bin
export PATH=$PATH:$PATH_LOC_BIN
export PATH=$PATH:$HOME/Config/scripts/linux

export BASHRC_LOADED=true

echo "--------------- BASHRC HELPERS ------------------"
if [ -f $HOME/.pyhyp_env ]; then  
   source $HOME/.pyhyp_env 
fi

if [ -f $HOME/libs/pyenv/bin/activate ]; then  
    module load python >/dev/null 2>&1
    echo "Sourcing pyenv"
    source $HOME/libs/pyenv/bin/activate
fi
echo "-------------------------------------------------"
