#! /usr/bin/env bash

#####
### Author: Akash Trehan
### Email: akash.trehan123@gmail.com
### Web: https://www.akashtrehan.com/
#####

### Tested on Ubuntu 18.04

CASSANDRA_DIR='cassandra'

kubectl create -f $CASSANDRA_DIR/cassandra-service.yaml && \
kubectl create -f $CASSANDRA_DIR/local-volumes.yaml && \
kubectl create -f $CASSANDRA_DIR/cassandra-statefulset.yaml && \
kubectl scale --replicas=$1 statefulset/cassandra
