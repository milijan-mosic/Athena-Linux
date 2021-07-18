#!/bin/bash




sudo timedatectl set-ntp true




git clone https://aur.archlinux.org/paru.git ~/ ; mv ~/paru ~/.paru_aur_installer
cd ~/.paru_aur_installer/ ; makepkg -sic --noconfirm ; cd ~/




general_programs="spectrwm thunderbird arandr firefox transmission-gtk ciano kamoso kdeconnect strawberry spectacle sxiv vlc blueberry gparted htop k3b nautilus psensor redshift gedit libreoffice-still zathura gnome-calculator gnome-disk-utility"
internet="icedtea-web webkit2gtk youtube-dl curl"
storage="android-file-transfer mtpfs ark cdrdao cdrtools dvd+rw-tools fuseiso pacman-contrib udiskie"
utilities="blueman bluez-tools hardinfo neofetch picom"
text="gedit-plugins zathura-pdf-mupdf ttf-font-awesome gnu-free-fonts"
extra="pulseaudio-bluetooth usbutils cmake dbus dialog lightdm lightdm-gtk-greeter"
misc="ffmpeg acpi man-db man-pages texinfo"
codecs="wavpack a52dec celt lame libavif libheif libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
user_choice="gxkb xxkb kcron testdisk code gimp ruby-sass ranger calcurse xwallpaper typescript npm"
add_this="termdown borg xlockmore xscreensaver"


user_programs="$general_programs $internet $storage $utilities $text $extra $misc $codecs $user_choice $add_this"


sudo pacman -Syu $user_programs --noconfirm
paru -S ttf-iosevka cherrytree nerd-fonts-complete --noconfirm




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/

cp -r ~/Athena-Linux/scrollbook ~/.scrollbook
rm ~/.scrollbook/32bit.sh
rm ~/.scrollbook/superuser_installation.sh
rm ~/.scrollbook/normal_installation.sh
rm ~/.scrollbook/server_installation.sh




sudo rm /etc/lightdm/lightdm.conf
sudo cp /Athena-Linux/files/lightdm.conf /etc/lightdm/

sudo systemctl enable --now lightdm




echo "exec spectrwm" >> ~/.xinitrc


rm ~/.bashrc
cp ~/Athena-Linux/files/bashrc_superuser ~/.bashrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/alacritty.yml ~/.config/alacritty/


mkdir -p ~/.psensor/
cp ~/Athena-Linux/files/psensor.cfg ~/.psensor/


cp ~/Athena-Linux/files/spectrwm.conf ~/.spectrwm.conf
mkdir -p ~/.config/spectrwm
cp ~/Athena-Linux/files/baraction.sh ~/.config/spectrwm/


mkdir .screenlayout
cp ~/Athena-Linux/files/monitor.sh ~/.screenlayout/
cp ~/Athena-Linux/files/laptop.sh ~/.screenlayout/


mkdir ~/.wallpaper/ ; cp ~/Athena-Linux/files/wallpaper.jpg ~/.wallpaper/


sudo cp ~/Athena-Linux/files/hosts /etc/hosts_old


mkdir -p ~/.config/ranger/plugins/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf


mkdir -p ~/.config/picom/
cp ~/Athena-Linux/files/picom.conf ~/.config/picom/




mkdir Music
mkdir Videos

mkdir Backup
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Projects
mkdir Pictures




rm -r ~/Athena-Linux ; rm ~/normal_installation.sh ; rm ~/superuser_installation.sh ; rm ~/server_installation.sh

paru -Scc --noconfirm
sudo pacman -Scc --noconfirm




reboot
