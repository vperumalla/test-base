#!/bin/bash
apt-get update
apt-get install -y gcc make automake apache2 php5 php5-mysql php5-gd libssh2-php libapache2-mod-php5 php5-mcrypt
service apache2 restart
sleep 10
apt-get install -y software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
add-apt-repository 'deb http://ftp.kaist.ac.kr/mariadb/repo/5.5/ubuntu precise main'
apt-get update
apt-get install -y mariadb-client
sleep 20
#------------------------------------------------------------------------------------------
clear
#echo "============================================"
#echo "WordPress Install Script"
#echo "============================================"
#echo "Database Name: "
#read -e dbname
#echo "Database User: "
#read -e dbuser
#echo "Database Password: "
#read -s dbpass
#echo "run install? (y/n)"
#read -e run
#if [ "$run" == n ] ; then
#exit
#else
#echo "============================================"
#echo "A robot is now installing WordPress for you."
#echo "============================================"
#Chanage dir to doucument root
cd /var/www/
#download wordpress
curl -O https://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
#change dir to wordpress
cd wordpress
#copy file to parent dir
cp -rf . ..
#move back to parent dir
cd ..
#remove files from wordpress folder
