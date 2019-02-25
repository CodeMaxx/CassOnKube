#! /usr/bin/env bash

#####
### Author: Akash Trehan
### Email: akash.trehan123@gmail.com
### Web: https://www.akashtrehan.com/
#####

### Tested on Ubuntu 18.04

kubectl create -f cassandra-service.yaml && \
kubectl create -f local-volumes.yaml && \
kubectl create -f cassandra-statefulset.yaml && \
kubectl scale --replicas=3 statefulset/cassandra
