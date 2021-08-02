#!/bin/bash

usage(){
  >&2 cat << EOF
Usage: $(basename $0) [USER] [GPU]
  USER: your logged in user
  GPU: nvidia or amd
EOF
} 

#check if running as root
[ "$EUID" -eq 0 ] || >&2 echo "Please run as root"; exit 1

#check if no argument is provided
case "$#" in
  0) usage;;
  1) >&2 echo "No graphics provided";;
esac



#check if user exists
if ! id "$1" &>/dev/null; then
    echo 'User not found'
    exit 1
fi

#check if packages installed install them if not
while read -r i;do
  if ! pacman -Qi "$i" &>/dev/null; then pacman -S --noconfirm "$i" ; fi
done < ./packages.list


if [ "$2" == "amdgpu" ]; then
  while read -r i;do
    if ! pacman -Qi "$i" &>/dev/null; then pacman -S --noconfirm "$i" ; fi
  done < ./packages.amdgpu.list
elif [ "$2" == "nvidia" ]; then
  pacman -S --noconfirm nvidia
fi

sudo -u $1 git clone https://aur.archlinux.org/yay.git /home/$1/yay
(cd /home/$1/yay && yes | sudo -u $1 makepkg -si)
sudo -u $1 rm -rf /home/$1/yay

while read -r i;do
  if ! pacman -Qi "$i" &>/dev/null; then yes | sudo -u $1 yay -S --noconfirm "$i" ; fi
done < ./packages_yay.list

#restore bashrc
rsync --progress shell/.bashrc /home/$1/

#restore gtk
rsync --progress gtk/.gtkrc-2.0 /home/$1/.gtkrc-2.0
rsync --progress -var gtk/gtk-2.0 /home/$1/.config/
rsync --progress -var gtk/gtk-3.0 /home/$1/.config/

#restore scripts
rsync --progress -var scripts /home/$1/


#restore xprofile...
rsync --progress xsession/.xprofile xsession/.xinitrc xsession/.Xresources xsession/.xsessionrc /home/$1/

sed s/user_placeholder/$1/ xsession/lock.service > xsession/lock.service

rsync --progress xsession/lock.service /etc/systemd/system/
systemctl enable lock.service
rsync --progress xsession/grub /etc/default/
grub-mkconfig -o /boot/grub/grub.cfg
rsync --progress xsession/logind.conf /etc/default/systemd/
systemctl kill -s HUP systemd-logind
rsync --progress xsession/xorg.conf.d/* /usr/share/X11/xorg.conf.d/
rsync --progress xsession/49-nopasswd_global.rules /etc/polkit-1/rules.d/

chown root /etc/systemd/logind.conf /etc/systemd/system/lock.service /etc/default/grub /usr/share/X11/xorg.conf.d/* /etc/polkit-1/rules.d/49-nopasswd_global.rules
chgrp root /etc/systemd/logind.conf /etc/systemd/system/lock.service /etc/default/grub /usr/share/X11/xorg.conf.d/* /etc/polkit-1/rules.d/49-nopasswd_global.rules



#backup config files
rsync --progress -var config/* /home/$1/.config/



chown -R $1 /home/$1/.* /home/$1/.config
chgrp -R $1 /home/$1/.* /home/$1/.config

#PowerTop
cat << EOF | tee /etc/systemd/system/powertop.service
[Unit]
Description=PowerTOP auto tune

[Service]
Type=oneshot
Environment="TERM=dumb"
RemainAfterExit=true
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable powertop.service

#enable other systemd services
systemctl enable NetworkManager
systemctl enable bluetooth

sudo -u $1 git clone https://github.com/postkpao/dwmFork.git /home/$1/dwmFork
(cd /home/$1/dwmFork && make clean install)

sudo -u $1 git clone git://git.suckless.org/slock.git /home/$1/slock
(cd /home/$1/slock && sed s/nobody/$1/ config.def.h | sed s/nogroup/wheel/ > config.def.h && make clean install)


#plug nvim
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


pip install neovim
pip install numpy

reboot
