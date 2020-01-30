#!/bin/bash

jawaban="Y"

read -p "Apakah kamu yakin akan menginstall database server ? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then
    echo "=============================>"
    echo "Menyiapkan Instalasi DB server"
    echo "=============================>"
    sudo apt-get update -y
    echo "=============================>"
    echo "Melakukan Installasi DB server"
    echo "=============================>"
    sudo apt-get install -y mariadb-server mariadb-client
    echo "=============================>"
    echo "Melakukan Konfigurasi DB server"
    echo "=============================>"
    sudo mysql --user=root <<-EOF
	UPDATE mysql.user SET authentication_string = PASSWORD('dbpassword') WHERE User='root';
	UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
	FLUSH PRIVILEGES;
	EOF
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
