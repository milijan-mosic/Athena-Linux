#!/bin/bash




timedatectl set-ntp true


# Deploy folders


apps="thunderbird arandr borg units firefox transmission-gtk ciano kamoso kdeconnect kphotoalbum strawberry pavucontrol spectacle sxiv vlc bleachbit blueberry doublecmd-gtk2 gparted htop k3b nautilus psensor redshift bookworm calibre gedit libreoffice-still mcomix paperwork zathura gnome-calculator korganizer kronometer gnome-disk-utility"
# Change sxiv to better photo viewer. This one is for advanced user.
# Htop without using terminal - is it possible?
internet=" icedtea-web webkit2gtk youtube-dl"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools fuseiso gzip mtpfs p7zip pacman-contrib udiskie unrar unzip zip"
utilities=" blueman bluez-tools bluez-utils cups cups-pdf dmidecode hardinfo neofetch picom"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts"
extra=" pulseaudio pulseaudio-alsa pulseaudio-bluetooth python-pyalsa"
misc=" ffmpeg mpc mpd acpi"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
browser_addons=" firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"


package_list="$apps$internet$storage$utilities$text$extra$misc$codecs$browser_addons"


sudo pacman -S $package_list --noconfirm
sudo pacman -Rns git --noconfirm
sudo pacman -Scc --noconfirm
