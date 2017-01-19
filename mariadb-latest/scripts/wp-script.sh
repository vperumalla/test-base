#!/bin/bash
apt-get update
apt-get install -y gcc make automake apache2 php5 php5-mysql php5-gd libssh2-php libapache2-mod-php5 php5-mcrypt
service apache2 restart
apt-get install -y software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
add-apt-repository 'deb http://ftp.kaist.ac.kr/mariadb/repo/5.5/ubuntu precise main'
apt-get update
apt-get install -y mariadb-client
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
#create wp config
cp wp-config-sample.php wp-config.php
#set database details with perl find and replace
##perl -pi -e "s/database_name_here/$dbname/g" wp-config.php
##perl -pi -e "s/username_here/$dbuser/g" wp-config.php
##perl -pi -e "s/password_here/$dbpass/g" wp-config.php

#set WP salts
##perl -i -pe'
##  BEGIN {
##    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
##    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
##    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
## }
##  s/put your unique phrase here/salt()/ge
##' wp-config.php

#create uploads folder and set permissions
mkdir wp-content/uploads
chmod 775 wp-content/uploads
echo "Cleaning..."
#remove zip file
rm /var/www/latest.tar.gz
#remove bash script
#rm wp.sh
echo "========================="
echo "Installation is complete."
echo "========================="
#fi
