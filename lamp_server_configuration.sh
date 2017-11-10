#!/bin/bash

############################################################################
########################### LAMP configuration #############################
############################ Written By Neil ###############################
################## Contact: tariqulislamseu@gmail.com ######################
############################################################################

apache_install() {
	
	echo -e "\e[32m Installing Apache..."
	printf "\n"
	sudo pacman -Sy apache --noconfirm
	sudo sed -i 's/LoadModule unique_id_module modules\/mod_unique_id.so/#LoadModule unique_id_module modules\/mod_unique_id.so/' /etc/httpd/conf/httpd.conf
	printf "\n"
	echo -e "\e[34m Enabling apache service at boot..."
	printf "\n"
	sudo systemctl enable httpd
	sudo systemctl start httpd
	printf "\n"
	echo -e "\e[92m Apache installed successfully!"
	printf "\n"
}	

mariadb_install() {
	echo -e "\e[32m Installing Mariadb..."
	printf "\n"
	sudo pacman -S mariadb --noconfirm
	printf "\n"
	echo -e "\e[34m Initializing Mariadb data directory..."
	printf "\n"
	sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	printf "\n"
	echo -e "\e[34m Enabling Mariadb service at boot..."
	printf "\n"
	sudo systemctl enable mariadb.service
	sudo systemctl start mariadb.service
	printf "\n"
	echo -e "\e[33m Now carefully configure mariadb database security according to your choice..."
	printf "\n"
	sudo /usr/bin/mysql_secure_installation
	printf "\n"
	echo -e "\e[92m Mariadb installed successfully!"
	printf "\n"
}

php_install() {
	echo -e "\e[32m Installing php..."
	printf "\n"
	sudo pacman -S php php-apache --noconfirm
	printf "\n"
	echo -e "\e[34m Configuring php modules..."
	printf "\n"
	sudo sed -i 's/;extension=bz2.so/extension=bz2.so/' /etc/php/php.ini
	sudo sed -i 's/;extension=mcrypt.so/extension=mcrypt.so/' /etc/php/php.ini
	sudo sed -i 's/;extension=mysqli.so/extension=mysqli.so/' /etc/php/php.ini
	sudo sed -i 's/;extension=pdo_mysql.so/extension=pdo_mysql.so/' /etc/php/php.ini
	sudo sed -i 's/;extension=pdo_sqlite.so/extension=pdo_sqlite.so/' /etc/php/php.ini
	sudo sed -i 's/;extension=zip.so/extension=zip.so/' /etc/php/php.ini
	sudo sed -i 's/LoadModule mpm_event_module modules\/mod_mpm_event.so/#LoadModule mpm_event_module modules\/mod_mpm_event.so/'  /etc/httpd/conf/httpd.conf
	sudo sed -i 's/^#LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/' /etc/httpd/conf/httpd.conf
	sudo sed -i '68 i\LoadModule php7_module modules/libphp7.so' /etc/httpd/conf/httpd.conf
	sudo sed -i '69 i\AddHandler php7-script php' /etc/httpd/conf/httpd.conf
	sudo sed -i '70 i\Include conf/extra/php7_module.conf' /etc/httpd/conf/httpd.conf
	printf "\n"
	sudo systemctl restart httpd
	printf "\n"
	echo -e "\e[92m Mariadb installed successfully!"
	printf "\n"
}

phpmyadmin_install() {
	echo -e "\e[32m Installing phpmyadmin..."
	printf "\n"
	sudo pacman -S php-mcrypt phpmyadmin --noconfirm
	printf "\n"
	echo -e "\e[34m Configuring phpmyadmin..."
	printf "\n"
	sudo touch /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo 'Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"' > /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo '<Directory "/usr/share/webapps/phpMyAdmin">' >> /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo 'DirectoryIndex index.php' >> /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo 'AllowOverride All' >> /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo 'Options FollowSymlinks' >> /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo 'Require all granted' >> /etc/httpd/conf/extra/phpmyadmin.conf
	sudo echo '</Directory>' >> /etc/httpd/conf/extra/phpmyadmin.conf
	sudo sed -i '$a\\n# phpMyAdmin configuration' /etc/httpd/conf/httpd.conf
	sudo sed -i '$a\\nInclude conf\/extra\/phpmyadmin.conf' /etc/httpd/conf/httpd.conf
	sudo sed -i '29s/cookie/config/' /etc/webapps/phpmyadmin/config.inc.php
	sudo sed -i '30 i\$cfg['Servers'][$i]['user'] = 'root';' /etc/webapps/phpmyadmin/config.inc.php
	sudo sed -i '31 i\$cfg['Servers'][$i]['password'] = '';' /etc/webapps/phpmyadmin/config.inc.php
	sudo sed -i '35s/false/true/' /etc/webapps/phpmyadmin/config.inc.php
	printf "\n"
	sudo systemctl restart httpd
	printf "\n"
	echo -e "\e[92m phpMyAdmin installed successfully!"
	printf "\n"
}



clear
echo -e "\e[36m Now installing the LAMP server..."
printf "\n"
printf "\n"
apache_install
printf "\n"
mariadb_install
printf "\n"
php_install
printf "\n"
phpmyadmin_install
printf "\n"
clear
dialog --backtitle "LAMP Installation Script" --infobox "LAMP server successfully installed!" 10 40
sleep 2
exit			
