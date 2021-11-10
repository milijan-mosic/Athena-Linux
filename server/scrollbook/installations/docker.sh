#!/bin/bash




sudo pacman -S docker docker-compose docker-machine kompose --noconfirm

sudo systemctl enable --now docker.service

#sudo docker run -it --rm archlinux bash -c "echo hello world" # Testing out if it's working...
