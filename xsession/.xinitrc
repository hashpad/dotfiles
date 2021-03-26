#!/bin/sh

#play-with-mpv &
#synergy &
sxhkd &

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi



if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources




if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


#status bar
./scripts/update.sh init &


./scripts/update.sh &


# start programs
nitrogen --restore &
#xbindkeys -p &
setxkbmap de &
pa-applet &
nm-applet &
cbatticon &
unclutter -idle 1 -jitter 2 -root &
picom &
#pavucontrol &
if (("$(ps aux | grep -o xfce4-power-manager | awk 'END{print NR}')"<"2"));then
  xfce4-power-manager --daemon &
fi
if (("$(ps aux | grep -o xfce4-clipman | awk 'END{print NR}')"<"2"));then
  xfce4-clipman &
fi
exec dwm
