#!/bin/bash




sudo timedatectl set-ntp true




general_programs=" plasma-desktop thunderbird print-manager arandr borg firefox transmission-gtk ciano kamoso kdeconnect strawberry spectacle gwenview vlc bleachbit blueberry gparted ksysguard k3b nautilus psensor redshift gedit libreoffice-still zathura gnome-calculator kronometer gnome-disk-utility"
internet=" icedtea-web webkit2gtk youtube-dl"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools mtpfs pacman-contrib udiskie"
utilities=" blueman bluez-tools bluez-utils cups cups-pdfneofetch picom"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts"
extra=" pulseaudio-bluetooth"
misc=" ffmpeg mpc mpd acpi lightdm lightdm-gtk-greeter"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
browser_addons=" firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"


user_programs="$general_programs$internet$storage$utilities$text$extra$misc$codecs$browser_addons"


sudo pacman -Syu $user_programs --noconfirm




sudo rm /etc/lightdm/lightdm.conf
sudo cp /Athena-Linux/files/lightdm.conf /etc/lightdm/




sudo systemctl enable --now cups.socket
sudo systemctl enable --now lightdm




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/

mkdir ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/updateNclean.sh ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/ytdl_audio.sh ~/.scrollbook/
cp ~/Athena-Linux/scrollbook/ytdl_video.sh ~/.scrollbook/




echo "exec startplasma-x11" >> ~/.xinitrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/alacritty.yml ~/.config/alacritty/


rm ~/.bashrc
cp ~/Athena-Linux/files/bashrc ~/.bashrc


mkdir Music
mkdir Videos
mkdir Documents
mkdir Downloads
mkdir Pictures




rm -r ~/Athena-Linux ; rm ~/normal.sh ; rm ~/superuser.sh ; rm ~/server.sh

sudo pacman -Rns wget git --noconfirm
sudo pacman -Scc --noconfirm




reboot
