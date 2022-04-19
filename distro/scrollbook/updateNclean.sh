#!/bin/bash




echo -e "\nUpdate mirror list? [Y/n]\n"
read answer1

echo -e "\nUpdate host file URLs? [Y/n]\n"
read answer2




if [ $answer1 == 'Y' ] || [ $answer1 == 'y' ]
then
	echo -e "\n\nUpdating mirror list...\n"
	sudo reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist
	echo -e "\nDone."
fi


if [ $answer2 == 'Y' ] || [ $answer2 == 'y' ]
then
	echo -e "\n\nUpdating host file URLs..."
	sudo rm /etc/hosts
	sudo wget -P /etc/ https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
	echo -e "\nDone."
fi




echo -e "\n\nUpdating system...\n"
sudo pacman -Syu --noconfirm
echo -e "\nDone."

echo -e "\n\nDeleting package managers' cache..."
sudo pacman -Qtdq | sudo pacman -Rns -
sudo pacman -Scc --noconfirm
rm -r ~/.cache/paru/clone
echo -e "\nDone.\n\n"
