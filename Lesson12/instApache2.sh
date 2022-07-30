#!/bin/bash

dName=`hostname`
ip=`hostname -I`

echo "Network name: $dName"
echo "IP address: $ip"

#sudo apt update 

id=$(systemctl status apache2 | grep PID | tr -s ' ' | cut -d ' ' -f4 | tr -d '/n')

stat=$(systemctl status apache2| grep Active | tr -s " " | cut -d ' ' -f 3)

if [ -z $id ] || [ $stat == "inactive" ]
then
  sudo apt install apache2 -y
else
  apache2 -version
fi

#`sudo ufw app list`

#`sudo ufw allow ‘Apache’`

#`sudo ufw status`

sudo systemctl status apache2


# Create a directory for your domain
user=$USER

`sudo mkdir -p /var/www/$dName/html`

`sudo chown -R $user:$user /var/www/$dName/html`

`sudo chmod -R 755 /var/www/$dName`

ubver=`lsb_release -a | grep 'Description' | cut -d ':' -f2`

`printf "<html>
 > <head>
 > <title>Welcome to $dName!</title>
 > </head>
 > <body>
 > <h1>You are running $dName on $ubver !</h1>
 > </body>
 > </html>" > /var/www/$dName/html/index.html`

#

# Create a virtual host file

`sudo touch /etc/apache2/sites-available/$dName.conf`

`sudo chmod o+rw /etc/apache2/sites-available/$dName.conf`

`printf "<VirtualHost *:80>
 > ServerAdmin admin@$dName
 > ServerName $dName
 > ServerAlias $dName
 > DocumentRoot /var/www/$dName/html
 > ErrorLog ${APACHE_LOG_DIR}/error.log
 > CustomLog ${APACHE_LOG_DIR}/access.log combined
 > </VirtualHost>" > /etc/apache2/sites-available/$dName.conf`



sudo a2ensite /etc/apache2/sites-available/$dName.conf

`sudo chmod o-rw /etc/apache2/sites-available/$dName.conf`

sudo a2dissite 000-default.conf

sudo systemctl restart apache2

sudo apache2ctl configtest

sudo chmod o+rw servername.conf
sudo echo "ServerName $dName" > /etc/apache2/conf-available/servername.conf
sudo chmod o-rw servername.conf

sudo apache2ctl configtest

echo "http://$dName"
