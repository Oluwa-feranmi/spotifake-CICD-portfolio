#!/bin/bash
echo "Running before install..."

cd /var/www/spotifake

# Update pip and install dependencies
sudo pip3 install --upgrade pip
sudo pip3 install -r requirements.txt --user

echo "Before install complete."