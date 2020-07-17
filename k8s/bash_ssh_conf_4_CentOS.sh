#! /usr/bin/env bash

now=$(date +"%m_%d_%Y")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

# 수정을 위해 root 권한이 필요함
# echo "bind '\"\\e\\e[C\": forward-word'" >> ~/.bash_profile
# echo "bind '\"\\e\\e[D\": backward-word'" >> ~/.bash_profile
# source ~/.bash_profile