# install Jenkins
ansible-playbook ansible/jenkins_install.yml -i ansible/inventories/serverconfig

curl -LI http://example.com/jenkins -o /dev/null -w '%{http_code}\n' -s
