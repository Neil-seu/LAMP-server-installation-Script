#!/bin/bash

############################################################################
########################### LAMP Server Remove #############################
############################ Written By Neil ###############################
################## Contact: tariqulislamseu@gmail.com ######################
############################################################################

clear
echo -e "\e[91m Removing lamp Server..."
printf "\n"
printf "\n"
echo -e "\e[91m Removing apache and it's configuration..."
printf "\n"
sudo pacman -Rcns apache --noconfirm
printf "\n"
sudo systemctl disable httpd
printf "\n"
printf "\n"
echo -e "\e[92m apache Server removed successfully!"

printf "\n"
echo -e "\e[91m Removing mariadb and it's configuration..."
printf "\n"
sudo pacman -Rcns mariadb --noconfirm
printf "\n"
sudo systemctl disable mariadb.service
printf "\n"
printf "\n"
echo -e "\e[92m mariadb removed successfully!"

printf "\n"
echo -e "\e[91m Removing php and it's configuration..."
printf "\n"
sudo pacman -Rcns php php-apache --noconfirm
printf "\n"
echo -e "\e[92m php removed successfully!"

printf "\n"
echo -e "\e[91m Removing phpmyadmin and it's configuration..."
printf "\n"
sudo pacman -Rcns php-mcrypt phpmyadmin --noconfirm
printf "\n"
sudo rm /etc/httpd/conf/extra/phpmyadmin.conf
printf "\n"
echo -e "\e[92m phpmyadmin removed successfully!"
printf "\n"
printf "\n"
echo -e "\e[96m Lamp Server successfully removed!"
sleep 2
exit
