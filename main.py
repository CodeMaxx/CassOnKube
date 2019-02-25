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
    parser.add_argument('-v', '--visor', help='Specify which hypervisor you want to use for virtualisation', default='virtualbox', choices=['virtualbox', 'kvm'])
    parser.add_argument('-s', '--server', help='Number of server', default=3, type=int)
    return parser

def run_command(command):
    p = subprocess.run(command, shell=True)
    if p.returncode != 0:
        print(colored("Aborting...", "red"))
        sys.exit()

def setup_cassandra(num):
    vols = ""

    for i in range(num):
        vols += "---\
        apiVersion: v1\
        kind: PersistentVolume\
        metadata:\
          name: cassandra-data-%d\
          labels:\
            type: local\
            app: cassandra\
        spec:\
          capacity:\
            storage: 1Gi\
          accessModes:\
            - ReadWriteOnce\
          hostPath:\
            path: /tmp/data/cassandra-data-%d\
          persistentVolumeReclaimPolicy: Recycle\n" % (i+1, i+1)

    with open('cassandra/local-volumes.yaml', 'w') as f:
        f.write(vols)

    run_command("scripts/setup_cassandra.sh %d", num)

def main():
    # Reading arguments
    parser = buildArgParser()
    args = parser.parse_args()

    # Install Docker
    run_command("scripts/install_docker.sh")

    # Install Kubernetes
    run_command("scripts/install_kubernetes.sh")

    # Install a hypervisor
    if args.v == 'virtualbox':
        run_command("scripts/install_virtualbox.sh")
    elif args.v == 'kvm':
        run_command("scripts/install_kvm.sh")

    # Install minikube
    run_command("scripts/install_minikube.sh")

    # Run minikube
    run_command("scripts/base_setup.sh")

    setup_cassandra(args.s)


if __name__ == '__main__':
    main()