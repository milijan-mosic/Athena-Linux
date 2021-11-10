#!/bin/bash




sudo pacman -S postgresql postgresql-docs postgresql-libs --noconfirm

sudo -iu postgres
# createuser --interactive # created_user


initdb -D /var/lib/postgres/data # Create DB
createdb myDatabaseName -O created_user

sudo systemctl enable --now postgresql.service

# pg_ctl -D /var/lib/postgres/data -l logfile start # Start DB

