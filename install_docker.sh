#####
### Author: Akash Trehan
### For Ubuntu 18.04
#####

RED='\033[0;31m'
NC='\033[0m'

if [ -x "$(command -v docker)" ]; then
    echo "Using " $(docker -v)
else
    echo -e "${RED}Installing docker...${NC}"
    echo "Updating Packages..."
    apt update
    echo "Installing Pre-requisites..."
    apt install -v apt-transport-https ca-certificates curl software-properties-common && \\
    echo "Adding Docker repository..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \\
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \\
    apt update
    apt install -y docker-ce
    if [ -x "$(command -v docker)" ]; then
        echo -e "${RED}" $(docker -v) " Installed!${NC}"
    else
        echo -e "${RED}Could not install Docker!${NC}"
        exit 1
    fi
fi
