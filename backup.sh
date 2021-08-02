#!/bin/bash

#check if no argument is provided
[ $# -eq 0 ] && >&2 echo "No arguments provided, please enter a user"; exit 1

#check if user exists
if ! id "$1" &>/dev/null; then
    echo 'user not found'
    exit 1
fi


#check if rsync is installed
if ! pacman -Qi rsync; then pacman -S --noconfirm rsync ; fi

#create needed dirs
mkdir -p shell
mkdir -p gtk/gtk-2.0 gtk/gtk-3.0
mkdir -p scripts
mkdir -p xsession/xorg.conf.d
mkdir -p config/cmus config/coc/ultisnips config/fontconfig config/htop config/mpv config/neofetch config/nvim config/picom config/ranger config/sxhkd config/termite 

#backup bashrc
rsync --progress /home/$1/.bashrc shell/

#backup gtk
rsync --progress /home/$1/.gtkrc-2.0 gtk/
rsync --progress /home/$1/.config/gtk-2.0/gtkfilechooser.ini gtk/gtk-2.0/
rsync --progress /home/$1/.config/gtk-3.0/settings.ini gtk/gtk-3.0/

#backup scripts
rsync --progress -var /home/$1/scripts/* scripts/


#backup xprofile...
rsync --progress /home/$1/.xinitrc /home/$1/.xprofile /home/$1/.Xresources /home/$1/.xsessionrc xsession/
rsync --progress /etc/default/grub /etc/systemd/system/lock.service /etc/systemd/logind.conf xsession/

#backup xorg files
rsync --progress /usr/share/X11/xorg.conf.d/* xsession/xorg.conf.d/
rsync --progress /etc/polkit-1/rules.d/49-nopasswd_global.rules xsession/


#backup config files
rsync --progress /home/$1/.config/cmus/autosave config/cmus/
rsync --progress -var /home/$1/.config/coc/ultisnips config/coc/ 
rsync --progress /home/$1/.config/fontconfig/fonts.conf config/fontconfig/
rsync --progress /home/$1/.config/htop/htoprc config/htop/
rsync --progress /home/$1/.config/mpv/mpv.conf config/mpv/
rsync --progress /home/$1/.config/neofetch/config.conf config/neofetch/
rsync --progress /home/$1/.config/nvim/init.vim /home/$1/.config/nvim/coc-settings.json config/nvim/
rsync --progress /home/$1/.config/picom/picom.conf config/picom/
rsync --progress /home/$1/.config/ranger/rc.conf /home/$1/.config/ranger/rifle.conf config/ranger/
rsync --progress /home/$1/.config/sxhkd/sxhkdrc config/sxhkd/
rsync --progress /home/$1/.config/termite/config config/termite/

chown -R $1 .
chgrp -R $1 .
