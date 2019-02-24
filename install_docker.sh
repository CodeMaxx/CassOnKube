#####
### Author: Akash Trehan
### For Ubuntu 18.04
#####

if [ -x "$(command -v docker)" ]; then
    echo "Using " $(docker -v)
else
    echo "Installing docker..."
    sudo apt update
    sudo apt install -v apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    sudo apt install -y docker-ce
fi

