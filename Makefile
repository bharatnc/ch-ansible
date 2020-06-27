ch:
	 @export ANSIBLE_CONFIG=inventories/ansible.cfg ; ansible-playbook -i inventories/inventory_nodes.yaml clickhouse-playbook.yaml -k



