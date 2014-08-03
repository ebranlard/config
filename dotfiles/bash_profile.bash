echo "--------------------------------------------------------------------"
echo "----------------------- BASH PROFILE -------------------------------"
echo "--------------------------------------------------------------------"

source $HOME/.profile

#switcher mpi = impi_4.1.1.036_intelv14.0.0


#if [ `tty` = "/dev/tty1" ]; then
#	startx&
#fi
# Load X11
#if [ -z "$DISPLAY" ]; then


#export PS1='\[\033[1m\]\[\033[1;33m\]\u:\[\e[32;1m\]\w \[\e[33;1m\]\$\[\033[m\] '
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
#fi

