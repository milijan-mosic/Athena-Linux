#!/bin/bash




addons="borg ufw htop hardinfo cmake python kcron testdisk termdown ncdu"
misc="pkgstats dbus pacman-contrib dialog git wget ranger neofetch"
archiver="ark p7zip unrar unarchiver unzip zip"
help="man-db man-pages texinfo"
server=""

packagelist="$addons $misc $archiver $help"

sudo pacman -S $packagelist --noconfirm




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/
cp -r ~/Athena-Linux/server/scrollbook ~/
mv ~/scrollbook ~/.scrollbook


rm ~/.bashrc
cp ~/Athena-Linux/server/files/dotfiles/bashrc ~/.bashrc




rm -r ~/Athena-Linux ; rm ~/installation.sh

# sudo pacman -Rns git
sudo pacman -Scc --noconfirm
