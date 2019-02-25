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

if [ -x "$(command -v kubectl)" ]; then
    echo -e "${GREEN}Kubernetes already installed!${NC}"
else
    echo -e "${GREEN}Installing Kubernetes (kubectl)...${NC}"
    echo -e "${BLUE}Updating Packages...${NC}"
    apt update && \
    echo -e "${BLUE}Installing Pre-requisites...${NC}" && \
    apt install -y apt-transport-https && \
    echo -e "${BLUE}Adding Docker repository...${NC}" && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo -e "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt update && \
    echo -e "${BLUE}Beginning kubectl Installation...${NC}" && \
    apt install -y kubectl kubeadm kubelet
    if [ -x "$(command -v kubectl)" ]; then
        apt install -y conntrack
        echo -e "source <(kubectl completion bash)" >> ~/.bashrc
        source <(kubectl completion bash)
        echo -e "${GREEN}Kubernetes Installed!${NC}"
        exit 0
    else
        echo -e "${RED}Could not install Kubernetes!${NC}"
        exit 1
    fi
fi
