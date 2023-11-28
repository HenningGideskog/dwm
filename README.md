# Dynamic Window Manager Configuration

This is my configuration of DWM by suckless.org, specifically tailored to Arch
Linux.

## Installation

Install som prerequisites:

    pacman -Syy xorg xorg-xinit ttf-fira-code pcmanfm slock openssh feh gcc make
    kitty dmenu

Next, build and install DWM:

    sudo make install

Lastly to install the included wallpaper, xinitrc and xorg keyboard config file:

    ./install.sh
