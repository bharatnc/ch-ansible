### Ansible for ClickHouse 

Ansible role for provisioning ClickHouse server.

### Local dev and testing

Provides a setup to locally test the ClickHouse server ansible roles.

#### Requirements
* Vagrant
* Virtualbox
* **Note:** This setup is verified to work with:
```bash
# dev machine 
➜  clickhouse-ansible git:(master) ✗ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04 LTS
Release:	20.04
Codename:	focal

# vagrant
➜  clickhouse-ansible git:(master) ✗ vagrant --version
Vagrant 2.2.9

# virtualbox
➜  clickhouse-ansible git:(master) ✗ vboxmanage --version
6.1.10_Ubuntur138449
```
#### How to spin up machines
 
1. Spin up vagrant box to provision

###### Single ClickHouse node

```bash
# Vagrantfile located in /dev/vagrant/clickhouse-node
➜  clickhouse-ansible git:(master) ✗ make vagrant-up-ch-node                            
```
###### ClickHouse Cluster (upto N nodes)

```bash
# Vagrantfile located in /dev/vagrant/clickhouse-cluster
# set N_CH_NODES suitably
➜  clickhouse-ansible git:(master) ✗ N_CH_NODES=3 make vagrant-up-ch-cluster                            
```
###### N number of Zookeeper nodes (standalone mode)

```bash
# Vagrantfile located in /dev/vagrant/zookeeper-nodes
# set N_ZK_NODES suitably
➜  clickhouse-ansible git:(master) ✗ N_ZK_NODES=1 make vagrant-up-zk-nodes                            
```

#### How to provision machines

* Run Make commands to provision. The Makefile uses ansible inventory information found under `hack` folder.
```bash
# note might need to install sshpass [on ubuntu]: sudo apt install sshpass
# SSH password & BECOME password: vagrant
```

###### Provision a single ClickHouse node

```bash
# Vagrantfile located in /dev/vagrant/clickhouse-node
➜  clickhouse-ansible git:(master) ✗ make provision-ch-node                            
```

###### Provision ClickHouse cluster nodes

```bash
# Vagrantfile located in /dev/vagrant/clickhouse-cluster
# set N_CH_NODES suitably
➜  clickhouse-ansible git:(master) ✗ N_CH_NODES=3 make provision-ch-cluster   
```

###### Provision N Number of Zookeeper nodes

```bash
# Vagrantfile located in /dev/vagrant/zookeeper-nodes
# set N_ZK_NODES suitably
➜  clickhouse-ansible git:(master) ✗ N_ZK_NODES=1 make provision-zk-nodes                            
```

###### Other actions - Reload
```bash
# restart nodes
clickhouse-ansible git:(master) ✗ make vagrant-reload-ch-node  
clickhouse-ansible git:(master) ✗ N_CH_NODES=3 make vagrant-reload-ch-cluster  
clickhouse-ansible git:(master) ✗ N_ZK_NODES=3 make vagrant-reload-zk-nodes  
```

###### Other actions - Tear down

```bash
# tear down nodes
clickhouse-ansible git:(master) ✗ make vagrant-down-ch-node  
clickhouse-ansible git:(master) ✗ N_CH_NODES=3 make vagrant-down-ch-cluster  
clickhouse-ansible git:(master) ✗ N_ZK_NODES=3 make vagrant-down-zk-nodes  
```
