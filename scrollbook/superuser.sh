#!/bin/bash

sudo pacman -S git vi man-db man-pages texinfo curl openssh wget gxkb kcron testdisk ardour code atom qtractor audacity flowblade gimp ruby-sass gcc-go go ranger cmatrix virtualbox virtualbox-host-modules-arch vim-latexsuite gummi calcurse xwallpaper --noconfirm

cd ~/ ; mkdir .myconfig
cd ~/.myconfig
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sic --noconfirm

cd ~/
git clone https://github.com/windwalk-bushido/AIFAL.git

yay -S ttf-iosevka gedit-latex cherrytree labyrinth peaclock --noconfirm

yay -Scc --noconfirm
sudo pacman -Scc --noconfirm