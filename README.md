### Ansible for ClickHouse 

Ansible role for provisioning Clickhouse server.

### Local dev and testing
This section is mainly for setting up a convenient local dev environment for testing and development if you want to
iterate on the Clickhouse ansible role.

#### Requirements
* Vagrant used for testing all changes. 
* Virtualbox used as Vagrant provider.
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
* Spin up vagrant box

```bash
# Vagrantfile located in /dev/clickhouse 
cd dev
vagrant up 
cd ..
```
* Provision using Makefile
```bash
# to provision ch 
# default password: vagrant
make ch
```