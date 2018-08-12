#!/usr/bin/env bash

# make apt to install just packages
mkdir -p /etc/dpkg/dpkg.cfg.d
cat >/etc/dpkg/dpkg.cfg.d/01_nodoc <<EOF
path-exclude /usr/share/doc/*
path-include /usr/share/doc/*/copyright
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
EOF

# make apt non-interactive and less verbose
export DEBIAN_FRONTEND=noninteractive
export APTARGS="-qq -o=Dpkg::Use-Pty=0"

# check if curl is installed
# check if nginx is installed
which curl nginx || {
  apt-get update ${APTARGS}
  apt-get install -y curl nginx ${APTARGS} 2>/dev/null
}

# stop nginx service
service nginx stop

# remove default conf of nginx
[ -f /etc/nginx/sites-available/default ] && {
  rm -fr /etc/nginx/sites-available/default
}

# copy our nginx conf
cp nginx.conf /etc/nginx/sites-available/default

# deploy our website
mkdir -p /var/www/html/
cp index.html /var/www/html/index.html

# start nginx service
service nginx start
