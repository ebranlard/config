
#########################################################
# GVIM SINGLE INSTANCE
function gv {
if [ "$#" -eq "0" ]; then
       /usr/bin/gvim --servername GVIMLOCAL      
else
        if echo "$*" | grep -q -- "--servername" ; then
        # echo "Command already has --servername use it"
        /usr/bin/gvim $*
        else
        #echo "Use default VIM server VIMLOCAL"
        /usr/bin/gvim --servername GVIMLOCAL --remote-tab-silent $*
        fi
fi
}
#alias gvim=gv
alias gvimt='gvim --remote-tab-silent'

#########################################################
# Bash params
#########################################################
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
if [[ `wc -l ~/.bash_history|awk '{print $1}'`  -gt 4500 ]]; then
    echo "Time to clean your bash history, with: clean-bash-history"
fi
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi
