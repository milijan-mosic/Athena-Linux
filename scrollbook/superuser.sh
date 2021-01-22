#!/bin/bash

sudo pacman -S vi man-db man-pages texinfo curl openssh wget gxkb kcron testdisk livewallpaper ardour code atom spotify qtractor audacity flowblade gimp ruby-sass gcc-go go ranger cmatrix virtualbox virtualbox-host-modules-arch vim-latexsuite gummi calcurse xwallpaper --noconfirm

cd ~/ ; mkdir Config
cd ~/Config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ~/
git clone https://github.com/windwalk-bushido/AIFAL.git

yay -S ttf-iosevka balena-etcher gedit-latex cherrytree labyrinth neroaac-bin openjpeg davs2 daala-git aften peaclock balena-etcher --noconfirm

yay -Scc --noconfirm
sudo pacman -Scc --noconfirm
