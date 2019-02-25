#! /usr/bin/env bash

#####
### Author: Akash Trehan
### Email: akash.trehan123@gmail.com
### Web: https://www.akashtrehan.com/
#####

### Tested on Ubuntu 18.04

add-apt-repository multiverse && \
apt-get update && \
apt install -y virtualbox

# Istalling kvm

egrep -c '(vmx|svm)' /proc/cpuinfo # Should be greater than 0
apt install cpu-checker
kvm-ok # Check if KVM acceleration can be used

# Install KVM
apt update && \
sudo apt install qemu qemu-kvm libvirt-bin virt-manager

sudo apt install bridge-utils

# KVM2 Driver installation for minkube
sudo apt install libvirt-clients libvirt-daemon-system && \
usermod -a -G libvirt $(whoami) && \
newgrp libvirt && \

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 && \
install docker-machine-driver-kvm2 /usr/local/bin/ && \
minikube config set vm-driver kvm2
