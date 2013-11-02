source /home/manu/Config/profiles/bashrc_common

alias ls='ls -F --color=always --group-directories-first'
alias grep='grep --color=always'

# if [ "$color_prompt" = yes ]; then
export PS1='\[[1m[31m\]\u\[[32m\]@\[[31m\]\h:\[[32m\]\w \[[31m\]\$ \[[32m\]\[[m\]'
#  export PS1='\[[1m[33m\]\u\[[32m\]@\[[33m\]\h:\[[32m\]\w \[[33m\]\$ \[[32m\]\[[m\]'
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
#export PS1='\[\033[1m\]\[\033[1;33m\]\u:\[\e[32;1m\]\w \[\e[33;1m\]\$\[\033[m\] '
#export PS1="\033[33;40m[\u@\h \w]\\$\007 \033[0m\007"
#export PS1='\[\033[33;40m\][\u@\h \[\e[33;40m\]\w]\[\e[33;1m\]\$\[\033[m\] '

#gpg --keyserver keyserver.ubuntu.com --recv 778978B00F7992B0
#gpg --export --armor 778978B00F7992B0 | sudo apt-key add -
