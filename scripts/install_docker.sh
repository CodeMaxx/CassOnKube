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

if [ -x "$(command -v docker)" ]; then
    echo -e "${GREEN}Using $(docker -v)${NC}"
else
    echo -e "${GREEN}Installing Docker...${NC}"
    echo -e "${BLUE}Updating Packages...${NC}"
    apt update && \
    echo -e "${BLUE}Installing Pre-requisites...${NC}" && \
    apt install -v apt-transport-https ca-certificates curl software-properties-common && \
    echo -e "${BLUE}Adding Docker repository...${NC}" && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt update && \
    echo -e "${BLUE}Beginning docker Installation...${NC}"
    apt install -y docker-ce
    if [ -x "$(command -v docker)" ]; then
        echo -e "${GREEN}$(docker -v) Installed!${NC}"
        exit 0
    else
        echo -e "${RED}Could not install Docker!${NC}"
        exit 1
    fi
fi
