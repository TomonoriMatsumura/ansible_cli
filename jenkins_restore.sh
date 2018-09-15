# Restore Jenkins
ansible-playbook ansible/jenkins_restore.yml -i ansible/inventories/serverconfig -e 'local_data_dir=/tmp'
