#!/bin/bash

cd ~/ ; mkdir .myconfig
cd ~/.myconfig
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sic --noconfirm

cd ~/
git clone https://github.com/windwalk-bushido/AIFAL.git
git clone https://github.com/windwalk-bushido/Athena-Linux.git
mv Athena-Linux Atina

cp ~/AIFAL/scrollbook/search.sh ~/.atina/scrollbook/
cp ~/AIFAL/scrollbook/yay.sh ~/.atina/scrollbook/
cp ~/AIFAL/scrollbook/mount-dvd.sh ~/.atina/scrollbook/
cp ~/AIFAL/scrollbook/unmount-dvd.sh ~/.atina/scrollbook/
cd ~/
chmod ugo+rwx ~/.atina/scrollbook/

rm -rf ~/.bashrc
cp ~/Atina/files/bashrc-superuser ~/
mv ~/bashrc-superuser ~/.bashrc

cd ~/ ; rm -rf ~/AIFAL ; rm -rf ~/Atina

yay -S ttf-iosevka gedit-latex cherrytree labyrinth peaclock --noconfirm

yay -Scc --noconfirm
sudo pacman -Scc --noconfirm
