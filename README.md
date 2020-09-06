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
#### Setup 
* Spin up vagrant box to provision

```bash
# Vagrantfile located in /dev/vagrant/clickhouse-node
➜  clickhouse-ansible git:(master) ✗ make vagrant-up-ch-node                            
```
* Run Make command to provision. The Makefile uses ansible inventory information found under `hack` folder.
```bash
# note might need to install sshpass [on ubuntu]: sudo apt install sshpass
# SSH password & BECOME password: vagrant
# to provision ClickHouse (single node)
➜  clickhouse-ansible git:(master) ✗ make vagrant-up-ch-node 
➜  clickhouse-ansible git:(master) ✗ make provision-ch-node  
# to destroy ClickHouse (single node)
➜  clickhouse-ansible git:(master) ✗ make vagrant-down-ch-node 

# to provision Zookeeper (single node)
➜  clickhouse-ansible git:(master) ✗ make vagrant-up-zk-node 
➜  clickhouse-ansible git:(master) ✗ make provision-zk-node  
# to destroy Zookeeper (single node)
➜  clickhouse-ansible git:(master) ✗ make vagrant-down-zk-node 
```