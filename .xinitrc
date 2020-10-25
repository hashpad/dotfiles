#!/bin/sh



userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
export GTK_THEME=Adwaita:dark

# merge in defaults and keymaps

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi



if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources



# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
unclutter -idle 1 -jitter 2 -root &
feh --bg-scale ~/Wallpapers/current.jpeg &
xcompmgr -o 0.7 &


./scripts/update.sh init &

while true; do
 ./scripts/update.sh
 sleep 3s
done& 


#KeyBoard Layout
sxhkd &
setxkbmap de &
xmodmap ~/.config/xmodmap.conf &
xbindkeys -p &
exec dwm
#exec startkde

