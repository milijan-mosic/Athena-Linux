#!/bin/bash




sudo pacman -S grafana --noconfirm # influxdb

sudo systemctl enable --now grafana.service
# sudo systemctl enable --now influxdb.service

