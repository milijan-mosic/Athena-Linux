#!/bin/bash

reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
