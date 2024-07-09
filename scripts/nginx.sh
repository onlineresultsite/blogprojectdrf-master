#!/usr/bin/bash

# Reload the systemd manager configuration
sudo systemctl daemon-reload

# Remove the default Nginx site configuration
sudo rm -f /etc/nginx/sites-enabled/default

# Copy the Nginx configuration file to the sites-available directory
sudo cp /home/ubuntu/blogprojectdrf-master/nginx/nginx.conf /etc/nginx/sites-available/blog

# Create a symbolic link in the sites-enabled directory
sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled/

# Add the 'ubuntu' user to the 'www-data' group
sudo gpasswd -a www-data ubuntu

# Restart the Nginx service
sudo systemctl restart nginx
