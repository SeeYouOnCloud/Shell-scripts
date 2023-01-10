#!/bin/bash

#Install mongodb using this script on ubuntu 22.04 machine 
#Install the dependencies
sudo apt update -y 
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common

#Download and add the MongoDB GPG key with the following command
sudo wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

#Create a list for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

#Update the local package database
sudo apt-get update -y

echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt-get update -y
sudo apt-get install libssl1.1

#Now Install the MongoDB with the following command
sudo apt-get install -y mongodb-org -y

#Start the MongoDB service and enable it to start automatically after rebooting the system.
sudo systemctl start mongod
sudo systemctl enable mongod
