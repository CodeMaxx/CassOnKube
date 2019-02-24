import argparse
import subprocess

VERSION = '1.0.0'

def buildArgParser():
    parser = argparse.ArgumentParser(description='Cassandra On Kube ver ' + VERSION)
    return parser

def main():
    parser = buildArgParser()


if __name__ == '__main__':
    main()