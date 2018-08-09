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

# start nginx service
service nginx start

# deploy our zillion dollar website
mkdir -p /var/www/html/

cp index.html /var/www/html/index.html

