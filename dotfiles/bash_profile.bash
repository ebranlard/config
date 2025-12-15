echo "--------------------------------------------------------------------"
echo "----------------------- BASH PROFILE -------------------------------"
echo "--------------------------------------------------------------------"

source $HOME/.profile

if [ `tty` = "/dev/tty1" ]; then
	startx&
fi
#  Load X11
if [ -z "$DISPLAY" ]; then
#export PS1='\[\033[1m\]\[\033[1;33m\]\u:\[\e[32;1m\]\w \[\e[33;1m\]\$\[\033[m\] '

Color_Off='\[\e[0m\]'       # Text Reset
BBlack='\[\e[1;30m\]'       # Bold Black
BRed='\[\e[1;31m\]'         # Bold Red
BGreen='\[\e[1;32m\]'       # Bold Green
BYellow='\[\e[1;33m\]'      # Bold Yellow
BBlue='\[\e[1;34m\]'        # Bold Blue
BPurple='\[\e[1;35m\]'      # Bold Purple
BCyan='\[\e[1;36m\]'        # Bold Cyan
BWhite='\[\e[1;37m\]'       # Bold White
export PS1="(profile) $BYellow\u$BGreen@$BYellow\h:$BGreen\w $BYellow\$ $Color_Off"
# Not loading bashrc
#source .bashrc

#For your .xinit you may want to use 'exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startxfce4', it's what I have found to work better.
#  if [ "$(tty)" = "/dev/tty1" ] ; then
#      if [ `ps -le|grep xinit|wc -l` == 0 ];	then
#            exec ck-launch-session startxfce4 ;
#            exec startxfce4 --with-ck-launch;
#          #xinit; 
#          echo "";
#          echo "Bye Bye";
#          echo ""
#          source .bashrc
#      fi
#  fi

# && [ $(tty) == /dev/tty1 ]; then
#	startx& 
fi

