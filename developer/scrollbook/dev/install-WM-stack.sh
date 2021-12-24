#!/bin/bash




sudo pacman -S bspwm sxhkd rofi calc python-pywal dmenu --noconfirm
paru -S polybar --noconfirm

mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/

install -Dm755 ~/Projects/Athena-Linux/files/dotfiles/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 ~/Projects/Athena-Linux/files/dotfiles/sxhkdrc ~/.config/sxhkd/sxhkdrc

git clone --depth=1 https://github.com/adi1090x/polybar-themes.git

cd polybar-themes
chmod +x setup.sh
bash setup.sh
cd ~/
rm -r polybar-themes

rm ~/.config/polybar/hack/config.ini
cp ~/Projects/Athena-Linux/files/dotfiles/config.ini ~/.config/polybar/hack/

echo "exec bspwm" > ~/.xinitrc
