# add user and configure sshd settings
ansible-playbook ansible/system_ssh_add-users-and-change-sshd-config-and-firewall.yml -i ansible/inventories/ssh-add -e ssh_port={{ SSH_PORT }} -e redmine_ip={{ REDMINE_IP }}

# update kernels
ansible-playbook ansible/system_kernel_update-and-remove-old-kernels.yml -i ansible/inventories/serverconfig

# update system
ansible-playbook ansible/system_update-and-set-selinux-disabled.yml -i ansible/inventories/serverconfig
