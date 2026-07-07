#!/bin/bash
# Script to install Nginx and a sample application on the source server

echo "Updating packages..."
sudo apt-get update -y

echo "Installing Nginx..."
sudo apt-get install nginx -y

echo "Configuring Nginx to start on boot..."
sudo systemctl enable nginx
sudo systemctl start nginx

echo "Deploying sample application..."
# Assuming sample-app contains our static files
if [ -d "./sample-app" ]; then
    sudo cp -r ./sample-app/* /var/www/html/
fi

echo "Installation complete! Nginx is serving traffic."
