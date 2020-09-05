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
➜  lsb_release -a
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.4 LTS
Release:	18.04
Codename:	bionic

# vagrant
➜ vagrant --version
Vagrant 2.2.6

# virtualbox
➜ vboxmanage --version
5.2.34_Ubuntur133883
```
#### Setup 
* Spin up vagrant box to provision

```bash
# Vagrantfile located in /dev/clickhouse-single-node
cd dev/clickhouse-single-node
vagrant up 
cd ..
```
* Run Make command to provision. The Makefile uses ansible inventory information found under `hack` folder.
```bash
# to provision ClickHouse (single node)
# note might need to install sshpass [on ubuntu]: sudo apt install sshpass
#  SSH password & BECOME password is vagrant
make dev-ch-single-node
```