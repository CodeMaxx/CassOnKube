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
    echo "${GREEN}Kubernetes already installed!${NC}"
else
    echo "${GREEN}Installing Kubernetes (kubectl)...${NC}"
    echo "${BLUE}Updating Packages...${NC}"
    apt-get update && \
    echo "${BLUE}Installing Pre-requisites...${NC}" && \
    apt-get install -y apt-transport-https && \
    echo "${BLUE}Adding Docker repository...${NC}" && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    echo "${BLUE}Beginning kubectl Installation...${NC}" && \
    sudo apt-get install -y kubectl
    if [ -x "$(command -v kubectl)" ]; then
        echo "${GREEN}Kubernetes Installed!${NC}"
        exit 0
    else
        echo "${RED}Could not install Kubernetes!${NC}"
        exit 1
    fi
fi
