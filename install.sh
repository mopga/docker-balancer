#!/usr/bin/env bash

#install Ansible on this node
echo -e "Installing Ansible"

if [[ $(cat /etc/*-release | grep PRETTY_NAME) == *"buntu"* ]]
   then
    echo "Install on Ubuntu"
    apt-add-repository ppa:ansible/ansible-2.6 -y > /dev/null 2>&1
    apt-get -qq update && apt-get -qq install -y ansible > /dev/null 2>&1
   else
    if [[ $(cat /etc/*-release | grep PRETTY_NAME) == *"CentOS"* ]]
           then
               echo "Install on Centos"
               yum install ansible -y > /dev/null 2>&1
           else
               echo "Install on Debian"
               echo 'deb http://http.debian.net/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
               apt update > /dev/null 2>&1
               apt -t stretch-backports install -y ansible > /dev/null 2>&1
        fi
fi
echo -e "Ansible installed"

echo -e "\nRun installing components\n"
#Start to install all

ansible-playbook -i "./inventory/static" playbooks/install.yml -e ansible_python_interpreter=/usr/bin/python