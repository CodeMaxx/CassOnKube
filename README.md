# CassOnKube

### Automates setting up of Cassandra on Kubernetes
#### (Uses minikube to run kubernetes locally)

1. Clone this repository

2. Install python dependencies

`pip3 install -r requirements.txt`

2. Inside the repository, run `main.py` with administrator permissions

```
usage: main.py [-h] [-v {virtualbox,kvm}] [-s SERVER]

Cassandra On Kube ver 1.0.0

optional arguments:
  -h, --help            show this help message and exit
  -v {virtualbox,kvm}, --visor {virtualbox,kvm}
                        Specify which hypervisor you want to use for
                        virtualisation
  -s SERVER, --server SERVER
                        Number of server
```

- Allows usage of either virtualbox or kvm as hypervisor [Default is virtualbox]
- Allows specifying the number of servers to keep in the cluster each having cassandra [Default is 3]

Sample command: `sudo ./main.py -s 4 -v kvm`


#### Possible Extensions:

1. Automate addition of servers dynamically
2. Provide an abstraction around modifying existing setups
