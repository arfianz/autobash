#!/bin/bash

jawaban="Y"

read -p "Apakah kamu yakin akan menginstall web server ? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then
    echo "=============================>"
    echo "Menyiapkan Instalasi Web Server"
    echo "=============================>"
    sudo apt-get update -y
    echo "=============================>"
    echo "Melakukan Installasi Web Server"
    echo "=============================>"
    sudo apt-get install -y apache2 php php-mysql libapache2-mod-php php-cli
    echo "=============================>"
    echo "Melakukan Konfigurasi Web Server"
    echo "=============================>"
    sudo systemctl enable apache2
    sudo systemctl start apache2
    sudo chmod -R 0755 /var/www/html/
    echo  "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
    echo "=============================>"
    echo "Silakan Melakukan Pengecekan Web Server di Browser PC User"
    echo "=============================>"
    echo "http://ip_vm_server"
    echo "http://ip_vm_server/info.php"
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
