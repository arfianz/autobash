#!/bin/bash
PASS=$2

echo "=============================>"
echo "Membuat Database untuk Aplikasi"
echo "=============================>"
sudo mysql -uroot -p<<MYSQL_SCRIPT
CREATE DATABASE $1;
CREATE USER '$1'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $1.* TO '$1'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
echo "=============================>"
echo "Hasilnya :"
echo "=============================>"
echo "Username:   $1"
echo "Password:   $PASS"
