dev-ch-single-node:
	 @export ANSIBLE_CONFIG=hack/inventories/ansible.cfg ; ansible-playbook -i hack/inventories/inventory_nodes.yaml clickhouse-single-node-playbook.yaml -kK



