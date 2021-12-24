#!/bin/bash




sudo timedatectl set-ntp true




git clone https://github.com/windwalk-bushido/Athena-Linux.git




git clone https://aur.archlinux.org/paru.git
mv ~/paru ~/.paru_aur_installer
cd ~/.paru_aur_installer/
makepkg -sic --noconfirm
cd ~/




programs="spectrwm ttf-font-awesome htop curl fuseiso hardinfo usbutils cmake dbus dialog man-db man-pages texinfo kcron testdisk gimp ranger calcurse xwallpaper termdown xlockmore xscreensaver ncdu virtualbox virtualbox-host-dkms linux-hardened-headers openssh sshfs godot python-pygame rsync code ruby-sass typescript npm nodejs yarn python-pip python-pipenv python-pipreqs python-redis redis postgresql postgresql-docs postgresql-libs pgadmin4 python-pg8000 python-psycopg2 python-pymongo python-mongomock"
sudo pacman -S $programs --noconfirm

programs="timeshift nerd-fonts-complete ngrok"
paru -S $programs --noconfirm




sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt




cp -r ~/Athena-Linux/developer/scrollbook ~/.scrollbook
rm ~/.scrollbook/32bit.sh




rm ~/.bashrc
cp ~/Athena-Linux/developer/dotfiles/bashrc_superuser ~/.bashrc




mkdir -p ~/.psensor/
cp ~/Athena-Linux/developer/dotfiles/psensor.cfg ~/.psensor/


mkdir .screenlayout
cp ~/Athena-Linux/developer/dotfiles/monitor.sh ~/.screenlayout/
cp ~/Athena-Linux/developer/dotfiles/laptop.sh ~/.screenlayout/


mkdir ~/.wallpaper
cp ~/Athena-Linux/distro/files/wallpaper.png ~/.wallpaper/
cp ~/Athena-Linux/distro/files/dark-portal.jpg ~/.wallpaper/


sudo cp ~/Athena-Linux/distro/files/sysfiles/hosts /etc/hosts_old


mkdir -p ~/.config/ranger/plugins/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" > ~/.config/ranger/rc.conf


mkdir -p ~/.config/picom/
cp ~/Athena-Linux/developer/dotfiles/picom.conf ~/.config/picom/


bash ~/Athena-Linux/developer/scrollbook/dev/install-WM-stack.sh
cp ~/Athena-Linux/developer/dotfiles/spectrwm.conf ~/.spectrwm.conf




mkdir Music
mkdir Videos

mkdir Backup
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Projects
mkdir Pictures




cp -r ~/Athena-Linux ~/Projects ; rm -r ~/.secret

sudo pacman -Scc --noconfirm
paru -Scc --noconfirm
rm -r ~/.cache/paru/clone




reboot
