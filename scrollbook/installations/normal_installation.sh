#!/bin/bash




sudo timedatectl set-ntp true




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/




bash ~/Athena-Linux/scrollbook/installations/base_programs.sh




sudo rm /etc/lightdm/lightdm.conf
sudo cp ~/Athena-Linux/files/sysfiles/lightdm.conf /etc/lightdm/




sudo systemctl enable --now cups.socket
sudo systemctl enable --now lightdm




mkdir ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/updateNclean.sh ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/ytdl_audio.sh ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/ytdl_video.sh ~/.scrollbook/




echo "export DESKTOP_SESSION=plasma">> ~/.xinitrc
echo "exec startplasma-x11">> ~/.xinitrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/dotfiles/alacritty.yml ~/.config/alacritty/


rm ~/.bashrc
cp ~/Athena-Linux/files/dotfiles/bashrc ~/.bashrc


mkdir Music
mkdir Videos
mkdir Documents
mkdir Downloads
mkdir Pictures




rm -r ~/Athena-Linux ; rm ~/normal_installation.sh ; rm ~/superuser_installation.sh ; rm ~/server_installation.sh

sudo pacman -Rns wget git --noconfirm
sudo pacman -Scc --noconfirm




reboot
