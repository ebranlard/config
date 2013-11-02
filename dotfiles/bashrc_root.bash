export PATH=$PATH:$HOME/Config/scripts/

export HOME2=$HOME/
# source $HOME2"Config/dotfiles/bashrc_machine.bash"
source $HOME2"Config/dotfiles/bashrc_common.bash"
# source $HOME2"Config/bash/git-completion.bash"

alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=always'

export PS1='\[[1m[31m\]\u\[[32m\]@\[[31m\]\h:\[[32m\]\w \[[31m\]\$ \[[32m\]\[[m\]'
