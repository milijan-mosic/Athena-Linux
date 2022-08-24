#!/bin/bash




cd ~/
sudo pacman -S docker docker-compose --noconfirm  # docker-machine docker-scan kompose python-docker python-dockerpty 

git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/
sudo cp Athena-Linux/server/files/dotfiles/daemon.json /etc/docker/

sudo systemctl enable --now docker.service
rm -r Athena-Linux

#sudo docker run -it --rm archlinux bash -c "echo hello world" # Testing out if it's working...
