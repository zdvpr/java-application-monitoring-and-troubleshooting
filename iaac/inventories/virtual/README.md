Playbook for production hosts
=============================

Run Virtual Machine with VirtualBox
-------------------
- Installed CentOS 8
- VM Network type: bridged adapter
- VM RAM ≥ 4Gb

Setup provisioning admin account
--------------------------------
Fix target hostname/address in `iaac/inventories/production/hosts.yml`

Install Ansible dependencies and roles dependencies
---------------------------------------------------
```shell
ansible-galaxy install -r requirements.yml
```
```shell
brew install gnu-tar # needed by cloudalchemy.prometheus role
```

Smoke test Ansible connection
-----------------------------
```shell
cd iaac
ansible -i inventories/virtual -m shell -a 'uname -a' all
ansible -i inventories/virtual -m shell -a 'cat /etc/os-release' all
```

Run playbook against production hosts inventory
-----------------------------------------------
```shell
no_proxy="*" ansible-playbook site.yml -i inventories/virtual
```
`no_proxy="*"` is due to python@MacOS issue.

Get terminal access to target host
----------------------------------
```shell
ssh root@{{ prod.host }}
```