#!/bin/bash




sudo pacman -S nginx-mainline rhit  --noconfirm


sudo rm /etc/nginx/nginx.conf
sudo cp ~/Athena-Linux/server/files/dotfiles/nginx.conf /etc/nginx/

echo -e "\n\n#### Path to website content:\n>>>"
read path

sudo cp -r $path/ /usr/share/nginx/html/


sudo systemctl enable --now nginx.service
