#!/usr/bin/env bash
apt-get -y update
apt-get install Nginx
ufw allow 'Nginx HTTP'
mkdir -p /data/web_static/
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/

echo "<html>
  <head>
  </head>
  <body>
    Hoblbeton School
  </body>
</html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data
sed -i '/listed 80 default_server/a location /hbnb_static/ { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
service nginx restart
exit 0
