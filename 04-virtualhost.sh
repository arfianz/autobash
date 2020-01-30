#!/bin/bash

jawaban="Y"

read -p "Apakah kamu yakin akan menginstall web server ? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then
    echo "=============================>"
    echo "Menyiapkan Virtual Host 1"
    echo "=============================>"
    sudo tee /etc/apache2/sites-available/arfian.conf <<-EOF
	<VirtualHost *:80>
		ServerAdmin webmaster@localhost
		ServerName arfian.local
		DocumentRoot /var/www/html/arfian
	<Directory />
		Options FollowSymLinks
		AllowOverride All
	</Directory>
	<Directory /var/www/html/arfian/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from All
	</Directory>
	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	<Directory "/usr/lib/cgi-bin">
		AllowOverride All
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Order allow,deny
		Allow from all
	</Directory>
	ErrorLog ${APACHE_LOG_DIR}/error.log
	LogLevel warn
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	</VirtualHost>
	EOF
    echo "=============================>"
    echo "Aktivasi Virtual Host 1"
    echo "=============================>"
    sudo a2ensite arfian.conf
    echo "=============================>"
    echo "Menyiapkan Virtual Host 2"
    echo "=============================>"
    sudo tee /etc/apache2/sites-available/kelascilsy.conf <<-EOF
	<VirtualHost *:80>
		ServerAdmin webmaster@localhost
		ServerName kelascilsy.local
		DocumentRoot /var/www/html/kelascilsy
	<Directory />
		Options FollowSymLinks
		AllowOverride All
	</Directory>
	<Directory /var/www/html/kelascilsy/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from All
	</Directory>
	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	<Directory "/usr/lib/cgi-bin">
		AllowOverride All
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Order allow,deny
		Allow from all
	</Directory>
	ErrorLog ${APACHE_LOG_DIR}/error.log
	LogLevel warn
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	</VirtualHost>
	EOF
    echo "=============================>"
    echo "Aktivasi Virtual Host 2"
    echo "=============================>"
    sudo a2ensite kelascilsy.conf
    echo "=============================>"
    echo "Menyiapkan Virtual Host 3"
    echo "=============================>"
    sudo tee /etc/apache2/sites-available/miniclass.conf <<-EOF
	<VirtualHost *:80>
		ServerAdmin webmaster@localhost
		ServerName miniclass.local
		DocumentRoot /var/www/html/miniclass
	<Directory />
		Options FollowSymLinks
		AllowOverride All
	</Directory>
	<Directory /var/www/html/miniclass/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from All
	</Directory>
	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	<Directory "/usr/lib/cgi-bin">
		AllowOverride All
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Order allow,deny
		Allow from all
	</Directory>
	ErrorLog ${APACHE_LOG_DIR}/error.log
	LogLevel warn
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	</VirtualHost>
	EOF
    echo "=============================>"
    echo "Aktivasi Virtual Host 3"
    echo "=============================>"
    sudo a2ensite miniclass.conf
    echo "=============================>"
    echo "Restart Web Server"
    echo "=============================>"
    sudo systemctl restart apache2
    echo "=============================>"
    echo "Instalasi Selesai"
    echo "=============================>"
    exit 0
else
    echo "=============================>"
    echo "Instalasi dibatalkan"
    echo "=============================>"
    exit 1
fi
