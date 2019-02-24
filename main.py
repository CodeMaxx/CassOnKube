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

def main():
    parser = buildArgParser()
    try:
        subprocess.check_output("./install_docker.sh", shell=True)
    except subprocess.CalledProcessError as e:
        print(colored("Aborting...", "red"))
        sys.exit()

if __name__ == '__main__':
    main()