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


if [ -x "$(command -v minikube)" ]; then
    echo -e "${GREEN}Using $(minikube version)${NC}"
else
    echo -e "${GREEN}Installing Minikube...${NC}"
    mkdir /tmp/cassonkube/ && cd /tmp/cassonkube && \
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
    chmod +x minikube && \
    cp minikube /usr/local/bin && rm minikube
    if [ -x "$(command -v minikube)" ]; then
        echo -e "${GREEN}Minikube Installed!${NC}"
    else
        echo -e "${RED}Could not install Minikube!${NC}"
        exit 1
    fi
fi
