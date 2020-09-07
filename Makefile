ANSIBLE_INVENTORY = "hack/inventory/inventory_dev"
ANSIBLE_CFG = "hack/inventory/ansible.cfg"
VAGRANT_CH = "dev/vagrant/clickhouse-node"
VAGRANT_CH_CLUSTER = "dev/vagrant/clickhouse-cluster"
# provision N standalone nodes with no replication
VAGRANT_ZK = "dev/vagrant/zookeeper-nodes"
N_ZK_NODES=3
N_CH_NODES=3


IP_CH_NODE = "192.168.0.50"

.PHONY: show-inventory
show-inventory:
	#[clickhouse-node]
	#192.168.0.50
	#
	#[clickhouse-cluster]
	#192.168.0.51
	#192.168.0.52
	#192.168.0.53
	#
	## standalone nodes with no replication
	#[zookeeper-nodes]
	#192.168.0.60
	#192.168.0.61
	#192.168.0.62


# actions on a single ch node
.PHONY: vagrant-up-ch-node
vagrant-up-ch-node:
	cd $(VAGRANT_CH) && IP_CH_NODE=$(IP_CH_NODE) vagrant up && cd -

.PHONY: vagrant-down-ch-node
vagrant-down-ch-node:
	cd $(VAGRANT_CH) && vagrant destroy -f && cd -

.PHONY: vagrant-reload-ch-node
vagrant-reload-ch-node:
	cd $(VAGRANT_CH) && vagrant reload && cd -

.PHONY: provision-ch-node
provision-ch-node:
	 @export ANSIBLE_CONFIG=$(ANSIBLE_CFG) ; ansible-playbook -i $(ANSIBLE_INVENTORY) -l clickhouse-node clickhouse-playbook.yaml -kK


# actions on a ch cluster
.PHONY: vagrant-up-ch-cluster
vagrant-up-ch-cluster:
	cd $(VAGRANT_CH_CLUSTER) &&  N_CH_NODES=$(N_CH_NODES) vagrant up && cd -

.PHONY: vagrant-down-ch-cluster
vagrant-down-ch-cluster:
	cd $(VAGRANT_CH_CLUSTER) && N_CH_NODES=$(N_CH_NODES) vagrant destroy -f && cd -

.PHONY: vagrant-reload-ch-cluster
vagrant-reload-ch-cluster:
	cd $(VAGRANT_CH_CLUSTER) && N_CH_NODES=$(N_CH_NODES) vagrant reload && cd -

.PHONY: provision-ch-cluster
provision-ch-cluster:
	 @export ANSIBLE_CONFIG=$(ANSIBLE_CFG) ; N_CH_NODES=$(N_CH_NODES) ansible-playbook -i $(ANSIBLE_INVENTORY) -l clickhouse-cluster clickhouse-playbook.yaml -kK


# actions on zk nodes
.PHONY: vagrant-up-zk-nodes
vagrant-up-zk-nodes:
	cd $(VAGRANT_ZK) && N_ZK_NODES=$(N_ZK_NODES) vagrant up && cd -

.PHONY: vagrant-down-zk-nodes
vagrant-down-zk-nodes:
	cd $(VAGRANT_ZK) && N_ZK_NODES=$(N_ZK_NODES) vagrant destroy -f && cd -

.PHONY: vagrant-reload-zk-nodes
vagrant-reload-zk-nodes:
	cd $(VAGRANT_ZK) && N_ZK_NODES=$(N_ZK_NODES) vagrant reload && cd -

.PHONY: provision-zk-nodes
provision-zk-nodes:
	 @export ANSIBLE_CONFIG=$(ANSIBLE_CFG) ; ansible-playbook -i $(ANSIBLE_INVENTORY) -l zookeeper-nodes zookeeper-playbook.yaml -kK