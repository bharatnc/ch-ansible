vagrant-up-ch-single-node:
	cd dev/vagrant/clickhouse-single-node && vagrant up && cd -

provision-ch-single-node:
	 @export ANSIBLE_CONFIG=hack/inventories/vagrant-ch-single-node/ansible.cfg ; ansible-playbook -i hack/inventories/vagrant-ch-single-node/inventory_nodes.yaml clickhouse-single-node-playbook.yaml -kK

vagrant-up-zk-single-node:
	cd dev/vagrant/zookeeper-single-node && vagrant up && cd -

provision-zk-single-node:
	 @export ANSIBLE_CONFIG=hack/inventories/vagrant-zk-single-node/ansible.cfg ; ansible-playbook -i hack/inventories/vagrant-zk-single-node/inventory_nodes.yaml zookeeper-single-node-playbook.yaml -kK