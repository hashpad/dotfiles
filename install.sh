#!/bin/bash

#check if no argument is provided
if [ $# -eq 0 ]; then
    echo "No arguments provided, please enter a user"
    exit 1
fi
#check if user exists
if ! id "$1" &>/dev/null; then
    echo 'user not found'
    exit 1
fi

#check if packages installed install them if not
for i in rsync xorg bash-completion cmus htop mpv neofetch nvim picom sxhkd termite make gcc cmake ranger sxhkd; do
  if ! pacman -Qi "$i"; then pacman -S --noconfirm "$i" ; fi
done

#backup bashrc
rsync --progress shell/.bashrc /home/$1/

#backup gtk
rsync --progress gtk/.gtkrc-2.0 /home/$1/.gtkrc-2.0
rsync --progress -var gtk/gtk-2.0 /home/$1/.config/
rsync --progress -var gtk/gtk-3.0 /home/$1/.config/

#backup scripts
rsync --progress -var scripts /home/$1/


#backup xprofile...
rsync --progress xsession/.xprofile xsession/.xinitrc xsession/.Xresources xsession/.xsessionrc /home/$1/
rsync --progress xsession/lock.service /etc/systemd/system/
systemctl enable lock.service
rsync --progress xsession/grub /etc/default/
grub-mkconfig -o /boot/grub/grub.cfg
rsync --progress xsession/logind.conf /etc/default/systemd/
systemctl kill -s HUP systemd-logind

chown root /etc/systemd/logind.conf /etc/systemd/system/lock.service /etc/default/grub
chgrp root /etc/systemd/logind.conf /etc/systemd/system/lock.service /etc/default/grub



#backup config files
rsync --progress -var config/* /home/$1/.config/



chown -R $1 /home/$1/.* /home/$1/.config
chgrp -R $1 /home/$1/.* /home/$1/.config
