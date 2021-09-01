#!/bin/bash




sudo timedatectl set-ntp true




git clone https://github.com/windwalk-bushido/Athena-Linux.git




git clone https://aur.archlinux.org/paru.git
mv ~/paru ~/.paru_aur_installer
cd ~/.paru_aur_installer/
makepkg -sic --noconfirm
cd ~/




bash ~/Athena-Linux/scrollbook/installations/base_programs.sh

programs="htop curl fuseiso hardinfo usbutils cmake dbus dialog man-db man-pages texinfo gxkb xxkb kcron testdisk gimp ranger calcurse xwallpaper termdown xlockmore xscreensaver rsync code ruby-sass typescript npm nodejs yarn composer php php-pgsql phppgadmin phpmyadmin mysql-workbench php-mongodb php-redis redis nginx-mod-redis nginx certbot-nginx rhit sshfs ncdu" # sxiv
thirtytwo="lib32-curl lib32-dbus"
sudo pacman -S $programs --noconfirm

programs="timeshift nerd-fonts-complete"
paru -S $programs --noconfirm




sudo systemctl enable --now cups.socket
#sudo systemctl enable --now ufw.service

# This should be done with 'sudo'. Don't implement it yet, do it manually first.
#ufw default deny
#ufw allow from 192.168.0.0/24
#ufw limit ssh
#ufw enable
# Open UDP and TCP ports 1714 through 1764 for KDE Connect. Also, open ports for Transmission-GTK.




cp -r ~/Athena-Linux/scrollbook ~/.scrollbook
rm ~/.scrollbook/32bit.sh
rm -r ~/.scrollbook/installations/




rm ~/.bashrc
cp ~/Athena-Linux/files/dotfiles/bashrc_superuser ~/.bashrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/dotfiles/alacritty.yml ~/.config/alacritty/


mkdir -p ~/.psensor/
cp ~/Athena-Linux/files/dotfiles/psensor.cfg ~/.psensor/


mkdir .screenlayout
cp ~/Athena-Linux/files/dotfiles/monitor.sh ~/.screenlayout/
cp ~/Athena-Linux/files/dotfiles/laptop.sh ~/.screenlayout/


mkdir ~/.wallpaper/ ; cp ~/Athena-Linux/files/wallpaper.jpg ~/.wallpaper/


sudo cp ~/Athena-Linux/files/sysfiles/hosts /etc/hosts_old


mkdir -p ~/.config/ranger/plugins/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" > ~/.config/ranger/rc.conf


mkdir -p ~/.config/picom/
cp ~/Athena-Linux/files/dotfiles/picom.conf ~/.config/picom/


bash ~/Athena-Linux/scrollbook/install-WM-stack.sh




mkdir Music
mkdir Videos

mkdir Backup
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Projects
mkdir Pictures




rm -r ~/Athena-Linux ; rm ~/normal_installation.sh ; rm ~/superuser_installation.sh ; rm ~/server_installation.sh

sudo pacman -Scc --noconfirm
paru -Scc --noconfirm




reboot
