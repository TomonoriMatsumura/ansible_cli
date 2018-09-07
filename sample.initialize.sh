######################################
#      change variables
######################################
ANSIBLE_USER=ansible
HOST_IP_ADDAR=exmaple.com
HOST_PASSWORD=password
SSH_PORT=22
REDMIE_IP=example.com
######################################
######################################


# データ用ディレクトリを初期化する
rm -rf ansible
git clone https://github.com/TomonoriMatsumura/ansible

# Inventoryファイルを作成する
cp ansible/inventories/host ansible/inventories/ssh-add
cp ansible/inventories/host ansible/inventories/serverconfig
rm ansible/inventories/host
rm ansible/inventories/localhost.cfg

# Inventoryファイル「ssh-add」の設定を変更する
sed -i -e "s/my server:/${HOST_IP_ADDAR}:/g"  ansible/inventories/ssh-add
sed -i -e "s/example.com/${HOST_IP_ADDAR}/g"  ansible/inventories/ssh-add
sed -i -e "s/password/${HOST_PASSWORD}/g"  ansible/inventories/ssh-add

# Inventoryファイル「serverconfig」の設定を変更する
sed -i -e "s/my server:/${HOST_IP_ADDAR}:/g" ansible/inventories/serverconfig
sed -i -e "s/example.com/${HOST_IP_ADDAR}/g" ansible/inventories/serverconfig
sed -i -e "s/password/${HOST_PASSWORD}/g"  ansible/inventories/serverconfig
sed -i -e "s/ansible_port: 22/ansible_port: ${SSH_PORT}/g" ansible/inventories/serverconfig
sed -i -e "s/ansible_user: root/ansible_user: ${ANSIBLE_USER}/g" ansible/inventories/serverconfig

# Playbook実行ファイルを作成し設定を変更する
rm -rf set-ssh_kernel-update_system-update.sh
cp sample.set-ssh_kernel-update_system-update.sh set-ssh_kernel-update_system-update.sh
sed -i -e "s/{{ SSH_PORT }}/${SSH_PORT}/g" set-ssh_kernel-update_system-update.sh
sed -i -e "s/{{ REDMINE_IP }}/${REDMIE_IP}/g" set-ssh_kernel-update_system-update.sh
