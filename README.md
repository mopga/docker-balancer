Install balansing system based on Docker, HAproxy, Consul, Consul-template and Registartor
------------------------------
# Desription

This project is written to simplyfy Load Balancing in case when you have Docker on machines and Docker only.
It has such components:

 - Consul (for service discovery)
 - Registartor (for regiser docker-containers in consul)
 - HAproxy for LoadBlance
 - Consul-template for auto-renew haproxy config



How it works in simple steps:

0. In you Dockerfile you must use label "SERVICE_NAME=your_serice_name"
1. Registartor is listen to docker socket on the current node
2. When the new service is running registartor send the host ip and port to consul
3. Consul-template listen to new events in consul-server and see the new instance of a service
4. Consul-template generate new haproxy configuration and restart HAproxy with it
5. You can run other instances of your service with the same label and they all will be balanced on port 8888
---
Note - HAproxy stats is enabled and will be available on port 9999
---


# Installation

## Workstation setup

Before deploying anything, the build node / workstation from where Ansible will run should be prepared.

This node must be able to connect to the other nodes via SSH.

Generate ssh keys:

```
ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -C ansible-user
```
Copy them to all hosts:
```
ssh-copy-id %ip_host%
```

### Tested with ubuntu server 14.04 TLS.

0.clone the repo:
1. edit inventory/static to add hosts for install. edit variables in playbooks/group_vars/all if you need custom settings (such as proxy)
2. run ./install.sh to install and run all.

It install ansible on this host and run the playbook that install all the components for Load Balancing

If you need any test - you can run the example in exapmles directory


