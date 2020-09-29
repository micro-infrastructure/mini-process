# Mini-PROCESS

Mini-process combines several services from PROCESS into one VM. These include LOBCDER for data management, a data node and a slurm node.
 
## Installation
- Install Vagrant, VirtualBox,  Ansible, GIT for Ubuntu:

`apt-get install vagrant virtualbox git ansible`
- Clone the mini-process

`git clone https://github.com/micro-infrastructure/mini-process.git`

`cd mini-process`

- Build a VM with LOBCDER and you micro-infrastructure from file user-infra.json

`make build`
- This will take a while....
- Once up the 3 default services can be accessed from your local browser.
	+ external: http://192.168.50.10:31003 internal: http://user-microinfra-scp.user:8888 for Jupyter
	+ external: http://192.168.50.10:31002 internal http://user-microinfra-scp.user:9002 for LOBCDER copy
	+ external: http://192.168.50.10:31001 internal http://user-microinfra-scp.user:9001 for webdav

- The slurm node is accessible through ssh on
+ external: 192.168.50.10 port 31022 internal: slurm.process-slurm port 22
	user xenon
	pass javagat

- The process core-infra service is accessible:
	+ external: http://192.168.50.10:30000 internal http://core-infra.process-core:4200

- You can suspend and resume the VM using

`make pause`
`make resume`

- To destroy the VM

`make clean`

## LOBCDER Copy
The x-access-token for accessing the LOBCDER copy REST API is found in mini-process/mini-lobcder/k8s-setup/userServiceToken.json after a successful installation.

## Core-infra
The x-access-token for accessing the core-infra REST API is found in mini-process/mini-lobcder/k8s-setup/userInfraToken.json after a successful installation.
