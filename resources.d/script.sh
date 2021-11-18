#!/bin/bash
apt update
apt install apache2 -y
echo 'Hello, World' > /var/www/html/index.html