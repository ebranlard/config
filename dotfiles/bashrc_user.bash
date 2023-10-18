# Avoid loading bashrc on scp
# NOTE: the line above make it bashrc crash, which is good otherwisht my scp fails
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

