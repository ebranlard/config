if [ ! -z ${BASHRC_LOADED} ]; then
    echo "Bashrc was already loaded";
fi

source $HOME"/""Config/dotfiles/bashrc_machine.bash"
source $HOME"/""Config/dotfiles/bashrc_common.bash"

export BASHRC_LOADED=true

# export PATH=$PATH:$HOME/Config/scripts/
