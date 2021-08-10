#!/bin/bash




general_programs="plasma-desktop kdeplasma-addons plank spectacle strawberry gwenview vlc blueberry ksysguard gnome-calculator kronometer"
internet="youtube-dl thunderbird firefox transmission-gtk kdeconnect ufw"
storage="android-file-transfer ark borg bleachbit gparted k3b nautilus gnome-disk-utility"
utilities="picom psensor redshift print-manager arandr ciano kamoso"
text="gedit libreoffice-still zathura gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts"
misc="ffmpeg mpc mpd acpi lightdm lightdm-gtk-greeter"

libraries="icedtea-web webkit2gtk cdrdao cdrtools dvd+rw-tools pacman-contrib mtpfs udiskie blueman bluez-tools bluez-utils cups cups-pdf system-config-printer neofetch pulseaudio-bluetooth powerdevil sshfs"
codecs="wavpack a52dec celt lame libavif libheif libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
browser_addons="firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"


user_programs="$general_programs $internet $storage $utilities $text $misc $libraries $codecs $browser_addons"


sudo pacman -Syu $user_programs --noconfirm
