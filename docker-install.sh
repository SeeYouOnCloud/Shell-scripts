#!/bin/bash

# Update package list
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the stable Docker repository to the system
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again and install Docker CE
sudo apt-get update
sudo apt-get install -y docker-ce

# Add your user to the "docker" group to avoid typing "sudo" when running Docker commands
sudo usermod -aG docker $USER

# Start the Docker service
sudo systemctl start docker

# Enable the Docker service to start on boot
sudo systemctl enable docker
