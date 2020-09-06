ANSIBLE_INVENTORY = "hack/inventory/inventory_dev"
ANSIBLE_CFG = "hack/inventory/ansible.cfg"
VAGRANT_CH = "dev/vagrant/clickhouse-node"
VAGRANT_CH_CLUSTER = "dev/vagrant/clickhouse-cluster"
VAGRANT_ZK = "dev/vagrant/zookeeper-node"

IP_CH_NODE = "192.168.0.50"
IP_ZK_NODE = "192.168.0.60"

.PHONY: show-inventory
show-inventory:
	# Current inventory
	#	  [clickhouse-node]
	#	  192.168.1.50
	#	  [zookeeper-node]
	#	  192.168.1.60

.PHONY: vagrant-up-ch-node
vagrant-up-ch-node:
	cd $(VAGRANT_CH) && IP_CH_NODE=$(IP_CH_NODE) vagrant up && cd -

.PHONY: vagrant-up-ch-cluster
vagrant-up-ch-cluster:
	cd $(VAGRANT_CH_CLUSTER) && vagrant up && cd -

.PHONY: vagrant-down-ch-node
vagrant-down-ch-node:
	cd $(VAGRANT_CH) && vagrant destroy -f && cd -

.PHONY: vagrant-down-ch-cluster
vagrant-down-ch-cluster:
	cd $(VAGRANT_CH_CLUSTER) && vagrant destroy -f && cd -

.PHONY: provision-ch-node
provision-ch-node:
	 @export ANSIBLE_CONFIG=$(ANSIBLE_CFG) ; ansible-playbook -i $(ANSIBLE_INVENTORY) -l clickhouse-node clickhouse-playbook.yaml -kK

.PHONY: provision-ch-cluster
provision-ch-cluster:
	 @export ANSIBLE_CONFIG=$(ANSIBLE_CFG) ; ansible-playbook -i $(ANSIBLE_INVENTORY) -l clickhouse-cluster clickhouse-playbook.yaml -kK


.PHONY: vagrant-up-zk-node
vagrant-up-zk-node:
	cd $(VAGRANT_ZK) && IP_ZK_NODE=$(IP_ZK_NODE)  vagrant up && cd -

.PHONY: vagrant-down-zk-node
vagrant-down-zk-node:
	cd $(VAGRANT_ZK) && vagrant destroy -f && cd -

.PHONY: provision-zk-node
provision-zk-node:
	 @export ANSIBLE_CONFIG=$(ANSIBLE_CFG) ; ansible-playbook -i $(ANSIBLE_INVENTORY) -l zookeeper-node zookeeper-single-node-playbook.yaml -kK