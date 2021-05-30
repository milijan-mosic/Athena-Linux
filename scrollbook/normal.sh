#!/bin/bash




cd ~/
sudo timedatectl set-ntp true




general_programs=" plasma-desktop sddm sddm-kcm numlockx thunderbird print-manager arandr borg units firefox transmission-gtk ciano kamoso kdeconnect kphotoalbum strawberry spectacle sxiv vlc bleachbit blueberry doublecmd-gtk2 gparted htop k3b nautilus psensor redshift bookworm calibre gedit libreoffice-still mcomix paperwork zathura gnome-calculator korganizer kronometer gnome-disk-utility"
internet=" icedtea-web webkit2gtk youtube-dl"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools fuseiso gzip mtpfs p7zip pacman-contrib udiskie unrar unzip zip"
utilities=" blueman bluez-tools bluez-utils cups cups-pdf dmidecode hardinfo neofetch picom"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts"
extra=" pulseaudio-bluetooth"
misc=" ffmpeg mpc mpd acpi"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
browser_addons=" firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"


user_programs="$general_programs$internet$storage$utilities$text$extra$misc$codecs$browser_addons"


# Change sxiv to better photo viewer. Sxiv is for advanced user.
# Htop without using terminal - is it possible?
# Change package list... minimal one :) For everyday use, later on you can extend "cool" ones...

sudo pacman -Syu $user_programs --noconfirm




sudo systemctl enable --now cups.socket
sudo systemctl enable --now sddm.service




echo "numlockx &" > ~/.xinitrc
echo " " >> ~/.xinitrc
echo "exec startplasma-x11" >> ~/.xinitrc


sudo mkdir /etc/sddm.conf.d/
sudo cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/sddm.conf


git clone https://github.com/windwalk-bushido/Athena-Linux.git

mkdir ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/updateNclean.sh ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/ytdl_audio.sh ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/ytdl_video.sh ~/.scrollbook/




mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/alacritty.yml ~/.config/alacritty/


rm ~/.bashrc
cp ~/Athena-Linux/files/bashrc ~/.bashrc


mkdir Music
mkdir Videos
mkdir Documents
mkdir Downloads
mkdir Pictures




rm -r ~/Athena-Linux ; rm ~/normal.sh ; rm ~/superuser.sh

sudo pacman -Rns wget git vim --noconfirm
sudo pacman -Scc --noconfirm




startx
