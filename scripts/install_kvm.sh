#! /usr/bin/env bash

#####
### Author: Akash Trehan
### Email: akash.trehan123@gmail.com
### Web: https://www.akashtrehan.com/
#####

### Tested on Ubuntu 18.04

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

dpkg -s qemu qemu-kvm libvirt-bin virt-manager

if [ $? -eq 0 ]; then
    echo -e "KVM already installed!"
else
    echo -e "${GREEN}Installing KVM...${NC}"
    echo -e "${BLUE}Pre-installation checks in progress...${NC}"
    val=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
    if [ $val -gt 0 ]; then
        apt install -y cpu-checker
        kvm-ok
        if [ $? -eq 0 ]; then
            echo -e "${BLUE}All checks passed. Beginning KVM installation...${NC}"
            apt update && \
            apt install -y qemu qemu-kvm libvirt-bin virt-manager
            apt install -y bridge-utils
            dpkg -s qemu qemu-kvm libvirt-bin virt-manager
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}KVM Installed!${NC}"
            else
                echo -e "${RED}Could not install KVM!${NC}"
                exit 1
            fi
        else
            echo -e "${RED}KVM acceleration cannot be used. Please try using virtualbox.${NC}"
            exit 1
        fi
    else
        echo -e "${RED}Virtualisation disabled. Please enable VT technology in BIOS.${NC}"
        exit 1
    fi
fi


echo -e "${GREEN}Installing KVM2 driver for minkube...${NC}"
apt install -y libvirt-clients libvirt-daemon-system && \
wget -c https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 && \
install docker-machine-driver-kvm2 /usr/local/bin/ && \
usermod -a -G libvirt $(whoami) && \
# newgrp libvirt && \

echo -e "${GREEN}Seting KVM as default hypervisor for minikube${NC}"
minikube config set vm-driver kvm2
exit 0
