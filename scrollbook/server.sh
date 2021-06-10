#!/bin/bash




sudo timedatectl set-ntp true




general_programs=" spectrwm xlockmore xscreensaver ark alacritty ranger htop neofetch git icedtea-web webkit2gtk curl gzip p7zip unrar unzip zip libunrar gnu-free-fonts man-db man-pages texinfo npm ngnix openssh"
php_stuff=" composer doxygen php php-apache php-pgsql php-phpdbg xdebug phppgadmin phpvirtualbox" # uwsgi-plugin-php <-- ?

programs="$general_programs$php_stuff"

sudo pacman -S $programs --noconfirm




sudo systemctl enable --now ngnix.service # Is this correct?
systemctl enable --now sshd.service




echo "exec spectrwm" >> ~/.xinitrc




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/

mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/alacritty.yml ~/.config/alacritty/

cp ~/Athena-Linux/files/spectrwm.conf ~/.spectrwm.conf
mkdir -p ~/.config/spectrwm
cp ~/Athena-Linux/files/baraction.sh ~/.config/spectrwm/




rm -r ~/Athena-Linux ; rm ~/normal.sh ; rm ~/superuser.sh ; rm ~/server.sh

sudo pacman -Scc --noconfirm




startx
