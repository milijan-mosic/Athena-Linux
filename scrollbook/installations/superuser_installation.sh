#!/bin/bash




sudo timedatectl set-ntp true




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/




git clone https://aur.archlinux.org/paru.git ~/ ; mv ~/paru ~/.paru_aur_installer
cd ~/.paru_aur_installer/ ; makepkg -sic --noconfirm ; cd ~/




bash ~/Athena-Linux/scrollbook/installations/base_programs.sh

programs="spectrwm sxiv htop curl fuseiso hardinfo usbutils cmake dbus dialog man-db man-pages texinfo gxkb xxkb kcron testdisk gimp ranger calcurse xwallpaper termdown xlockmore xscreensaver code ruby-sass typescript npm yarn composer php php-pgsql phppgadmin php-mongodb php-redis redis ngnix-mod-redis nginx certbot-nginx rhit"

sudo pacman -Syu $programs --noconfirm
paru -S ttf-iosevka cherrytree nerd-fonts-complete --noconfirm




programs="gwenview ksysguard lightdm lightdm-gtk-greeter"

sudo pacman -Rns $programs --noconfirm




cp -r ~/Athena-Linux/scrollbook ~/.scrollbook
rm ~/.scrollbook/32bit.sh
rm -r ~/.scrollbook/installations/




echo "exec spectrwm" >> ~/.xinitrc


rm ~/.bashrc
cp ~/Athena-Linux/files/dotfiles/bashrc_superuser ~/.bashrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/dotfiles/alacritty.yml ~/.config/alacritty/


mkdir -p ~/.psensor/
cp ~/Athena-Linux/files/dotfiles/psensor.cfg ~/.psensor/


cp ~/Athena-Linux/files/dotfiles/spectrwm.conf ~/.spectrwm.conf


mkdir .screenlayout
cp ~/Athena-Linux/files/dotfiles/monitor.sh ~/.screenlayout/
cp ~/Athena-Linux/files/dotfiles/laptop.sh ~/.screenlayout/


mkdir ~/.wallpaper/ ; cp ~/Athena-Linux/files/wallpaper.jpg ~/.wallpaper/


sudo cp ~/Athena-Linux/files/sysfiles/hosts /etc/hosts_old


mkdir -p ~/.config/ranger/plugins/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> ~/.config/ranger/rc.conf


mkdir -p ~/.config/picom/
cp ~/Athena-Linux/files/dotfiles/picom.conf ~/.config/picom/




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
