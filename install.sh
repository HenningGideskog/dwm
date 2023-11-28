#!/bin/bash
cp xinitrc $HOME/.xinitrc
cp wallpaper.png $HOME/.wallpaper.png
sudo cp xorg_conf/00-keyboard.conf /etc/X11/xorg.conf.d/
echo "Please consider modifying and copying config files in xorg_conf."
