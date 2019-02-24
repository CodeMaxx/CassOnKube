#! /usr/bin/env python3

#####
### Author: Akash Trehan
### Email: akash.trehan123@gmail.com
### Web: https://www.akashtrehan.com/
#####

import argparse
import subprocess
import sys
from termcolor import colored

VERSION = '1.0.0'

def buildArgParser():
    parser = argparse.ArgumentParser(description='Cassandra On Kube ver ' + VERSION)
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

    # Install Docker
    run_command("./install_docker.sh")

    # Install Kubernetes
    run_command("./install_kubernetes.sh")


if __name__ == '__main__':
    main()