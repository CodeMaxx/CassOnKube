#! /usr/bin/env python3

#####
### Author: Akash Trehan
### Email: akash.trehan123@gmail.com
### Web: https://www.akashtrehan.com/
#####

### Tested on Ubuntu 18.04

import argparse
import subprocess
import sys
from termcolor import colored

VERSION = '1.0.0'

def buildArgParser():
    parser = argparse.ArgumentParser(description='Cassandra On Kube ver ' + VERSION)
    parser.add_argument('-h', '--hypervisor', help='Specify which hypervisor you want to use for virtualisation: kvm or virtualbox', default='virtualbox', choices=['virtualbox', 'kvm'])
    return parser

def run_command(command):
    try:
        subprocess.check_output(command, shell=True)
    except subprocess.CalledProcessError as e:
        print(colored("Aborting...", "red"))
        sys.exit()

def main():
    # Reading arguments
    parser = buildArgParser()
    args = parser.parse_args()

    # Install Docker
    run_command("./install_docker.sh")

    # Install Kubernetes
    run_command("./install_kubernetes.sh")

    # Install a hypervisor
    if args.h == 'virtualbox':
        run_command("./install_virtualbox.sh")
    elif args.h == 'kvm':
        run_command("./install_kvm.sh")

    # Install minikube
    run_command("./install_minikube.sh")

    # Run minikube
    run_command("./basic_setup.sh")


if __name__ == '__main__':
    main()