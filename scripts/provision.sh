#!/usr/bin/env bash

# check if curl is installed
# install curl if not installed
which curl || {
  echo no, curl its not installed 
  apt-get update
  apt-get install -y curl
}

# check if nginx is installed
# install nginx if not installed
which nginx || {
  echo no, nginx its not installed 
  apt-get update
  apt-get install -y nginx
}

# stop nginx service
service nginx stop

# remove default conf of nginx
[ -f /etc/nginx/sites-available/default ] && {
  rm -fr /etc/nginx/sites-available/default
}

# copy our nginx conf
cp /vagrant/nginx.conf /etc/nginx/sites-available/default

# start nginx service
service nginx start

# deploy our zillion dollar website
mkdir -p /var/www/html/

cp index.html /var/www/html/index.html

