#!/bin/bash

jawaban="Y"

read -p "Apakah kamu yakin akan melakukan setup Aplikasi Web ? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then
    echo "=============================>"
    echo "Mengunduh Aplikasi Wordpress"
    echo "=============================>"
    curl -O https://wordpress.org/latest.tar.gz
    echo "=============================>"
    echo "Ekstrak File"
    echo "=============================>"
    tar -zxvf latest.tar.gz
    echo "=============================>"
    echo "Memindahkan Aplikasi ke Direktori Virtual Host"
    echo "=============================>"
    sudo rm -Rf /var/www/html/*
    sudo cp -Rf wordpress /var/www/html/miniclass
    sudo cp -Rf wordpress /var/www/html/kelascilsy
    sudo cp -Rf wordpress /var/www/html/arfian
    echo "=============================>"
    echo "Membuat Direktori Upload untuk masing-masing Virtual Host"
    echo "=============================>"
    sudo mkdir /var/www/html/miniclass/wp-content/uploads
    sudo chmod 775 /var/www/html/miniclass/wp-content/uploads
    sudo mkdir /var/www/html/kelascilsy/wp-content/uploads
    sudo chmod 775 /var/www/html/kelascilsy/wp-content/uploads
    sudo mkdir /var/www/html/arfian/wp-content/uploads
    sudo chmod 775 /var/www/html/arfian/wp-content/uploads
    echo "=============================>"
    echo "Bersih-bersih"
    echo "=============================>"
    rm -rf wordpress
    rm -f latest.*
    echo "=============================>"
    echo "Instalasi Selesai"
    echo "=============================>"
    exit 0
else
    echo "=============================>"
    echo "Instalasi Dibatalkan"
    echo "=============================>"
    exit 1
fi
