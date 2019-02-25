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


if [ -x "$(command -v vboxmanage)" ]; then
    echo -e "${GREEN}Using VirtualBox $(vboxmanage --version)${NC}"
else
    val=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
    if [ $val -gt 0 ]; then
        echo -e "${GREEN}Installing VirtualBox...${NC}"
        add-apt-repository multiverse && \
        apt-get update && \
        apt install -y virtualbox
        if [ -x "$(command -v vboxmanage)" ]; then
            echo -e "${GREEN}VirtualBox Installed!${NC}"
        else
            echo -e "${RED}Could not install VirtualBox!${NC}"
            exit 1
        fi
    else
        echo -e "${RED}Virtualisation disabled. Please enable VT technology in BIOS.${NC}"
        exit 1
    fi
fi
