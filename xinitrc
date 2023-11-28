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

#### Henning Config

feh --no-fehbg --bg-scale $HOME/.wallpaper.png

eval $(ssh-agent)

# Add SSH-keys to agent:
# ssh-add $HOME/.ssh/example_key

up_time() {
        uptime -p | sed -e s/up/Up:/ -e s/\ minute*./m/ -e s/\ hour*./h/ -e s/\ day*./d/
}

while xsetroot -name "$(up_time) | $(date +"W %V | %Y-%m-%d | %H:%M:%S ")"
do
	sleep 1
done &
exec dwm
