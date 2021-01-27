#!/bin/bash

sudo pacman -S git vi man-db man-pages texinfo curl openssh wget gxkb kcron testdisk ardour code atom qtractor audacity flowblade gimp ruby-sass gcc-go go ranger cmatrix virtualbox virtualbox-host-modules-arch vim-latexsuite gummi calcurse xwallpaper --noconfirm

cd ~/ ; mkdir .myconfig
cd ~/.myconfig
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sic --noconfirm

cd ~/
git clone https://github.com/windwalk-bushido/AIFAL.git
git clone https://github.com/windwalk-bushido/Atina.git


cp ~/AIFAL/scrollbook/search.sh ~/.atina/scrollbook/
cp ~/AIFAL/scrollbook/yay.sh ~/.atina/scrollbook/
cp ~/AIFAL/scrollbook/mount-dvd.sh ~/.atina/scrollbook/
cp ~/AIFAL/scrollbook/unmount-dvd.sh ~/.atina/scrollbook/
cd ~/

rm -rf ~/.bashrc
cp ~/Atina/files/bashrc-superuser ~/
mv ~/bashrc-superuser ~/.bashrc

cd ~/ ; rm -rf ~/AIFAL ; rm -rf ~/Atina

yay -S ttf-iosevka gedit-latex cherrytree labyrinth peaclock --noconfirm

yay -Scc --noconfirm
sudo pacman -Scc --noconfirm
