#!/bin/bash




general_programs="openal alsa alsa-utils pulseaudio pulseaudio-alsa pavucontrol plasma-desktop kdeplasma-addons plank spectacle strawberry gwenview vlc blueberry ksysguard gnome-calculator kronometer"
internet="youtube-dl thunderbird firefox transmission-gtk kdeconnect ufw"
storage="android-file-transfer ark borg bleachbit gparted k3b nautilus gnome-disk-utility"
utilities="picom psensor redshift print-manager arandr ciano kamoso"
text="gedit libreoffice-still zathura gedit-plugins zathura-pdf-mupdf cherrytree vym ttf-font-awesome ttf-inconsolata gnu-free-fonts ttc-iosevka"
misc="ffmpeg acpi lightdm lightdm-gtk-greeter"

libraries="icedtea-web webkit2gtk cdrdao cdrtools dvd+rw-tools pacman-contrib mtpfs udiskie blueman bluez-tools bluez-utils cups cups-pdf bluez-cups system-config-printer neofetch pulseaudio-bluetooth powerdevil"
codecs="wavpack a52dec celt lame libavif libheif libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
browser_addons="firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"

thirtytwo="lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-libcups lib32-wavpack lib32-celt lib32-twolame lib32-opus lib32-libvorbis lib32-speex lib32-speexdsp lib32-flac lib32-libwebp lib32-libdv lib32-libtheora lib32-libvpx lib32-libnm lib32-glu lib32-mesa lib32-openal"

user_programs="$general_programs $internet $storage $utilities $text $misc $libraries $codecs" # $browser_addons


sudo pacman -S $user_programs --noconfirm
