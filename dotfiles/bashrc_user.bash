# Avoid loading bashrc on scp
if [ -z "${PS1}" ]; then
    return
fi

if [ ! -z ${BASHRC_LOADED} ]; then
    echo "Reloading bashrc";
fi

source $HOME"/""Config/dotfiles/bashrc_machine.bash"
source $HOME"/""Config/dotfiles/bashrc_common.bash"

export BASHRC_LOADED=true
# echo "Bashrc loaded"

# export PATH=$PATH:$HOME/Config/scripts/
