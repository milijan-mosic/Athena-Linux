#!/bin/bash




sudo timedatectl set-ntp true




cd ~/
git clone https://github.com/windwalk-bushido/Athena-Linux.git




bash Athena-Linux/distro/scrollbook/base_programs.sh




sudo rm /etc/lightdm/lightdm.conf
sudo cp Athena-Linux/distro/files/sysfiles/lightdm.conf /etc/lightdm/




sudo systemctl enable --now cups.socket
sudo systemctl enable --now lightdm




amixer sset "Auto-Mute Mode" Disabled
alsactl store




mkdir .scrollbook/
cp Athena-Linux/distro/scrollbook/updateNclean.sh .scrollbook/
cp Athena-Linux/distro/scrollbook/ytdl_audio.sh .scrollbook/
cp Athena-Linux/distro/scrollbook/ytdl_video.sh .scrollbook/
cp Athena-Linux/distro/scrollbook/remove_package_orphans.sh .scrollbook/




echo "export DESKTOP_SESSION=plasma" > .xinitrc
echo "exec startplasma-x11" >> .xinitrc


mkdir -p .config/alacritty
cp Athena-Linux/distro/files/dotfiles/alacritty.yml .config/alacritty/


rm .bashrc
cp Athena-Linux/distro/files/dotfiles/bashrc .bashrc


mkdir Music
mkdir Videos
mkdir Documents
mkdir Downloads
mkdir Pictures




rm -r Athena-Linux
rm normal_installation.sh


sudo pacman -Scc --noconfirm




reboot
