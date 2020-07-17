#! /usr/bin/env bash

now=$(date +"%m_%d_%Y")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

# if [ "$(whoami)" != "root" ]
# then
#        sudo su -s "$0"
#        exit
# fi

if [ "$(whoami)" != "root" ]
then
       su -
       vagrant
       echo "bind '\"\\e\\e[C\": forward-word'" >> ~/.bash_profile
       echo "bind '\"\\e\\e[D\": backward-word'" >> ~/.bash_profile
       source ~/.bash_profile
       exit
fi
