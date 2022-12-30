#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


picom --config ~/.config/picom/picom.conf &

# gif
# xwinwrap -g 1920x1080 -ni -b -fs -ov -nf -- gifview -w WID ~/Downloads/rei.gif -a &

# https://moewalls.com/anime/rei-ayanami-in-the-rain-neon-genesis-evangelion-live-wallpaper/
# video
xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio ~/Downloads/rei.mp4 

# feh --bg-scale ~/Images/best_girl_nowater.jpg

setxkbmap -option caps:escape

exec bspwm

