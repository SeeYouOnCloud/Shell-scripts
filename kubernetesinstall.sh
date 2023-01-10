#!/bin/sh
sudo apt-get update

#install Docker with the command
sudo apt-get install docker.io

#Set Docker to launch at boot
sudo systemctl enable docker
sudo systemctl start docker

#Add Kubernetes Signing Key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add


#Kubernetes is not included in the default repositories. To add them, enter the following:
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

#Install Kubernetes tools with the command:
sudo apt-get install kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl

#Start by disabling the swap memory on each server:
sudo swapoff -a

#enable and start kubelet
#sudo systemctl enable kubelet
#sudo systemctl start kubelet
#Decide which server to set as the master node. Then enter the command:
sudo hostnamectl set-hostname master-node

#Next, set a worker node hostname by entering the following on the worker server:
#sudo hostnamectl set-hostname worker01

#to run this command it is mandatory to have 2vcpu and min RAM 1700MB(requires t2.medium instance)
#Switch to the master server node, and enter the following:
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#A Pod Network is a way to allow communication between different nodes in the cluster. This tutorial uses the flannel virtual network.
sudo kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml