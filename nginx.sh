#!/bin/bash

sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html