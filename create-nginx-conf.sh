#!/bin/bash

# Create a nginx configuration file for Django application
# Create the configuration file
sudo touch /etc/nginx/sites-available/filename.conf

# Add the reverse proxy configuration to the file
sudo echo "server {
    server_name example.com;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        alias /home/ubuntu/ProjectFolder/static/;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}" >> /etc/nginx/sites-available/filename.conf

# Test the configuration
sudo nginx -t

#Activate it
sudo ln -s /etc/nginx/sites-available/filename.conf /etc/nginx/sites-enabled/

# Restart the nginx service to apply the changes
sudo systemctl restart nginx
