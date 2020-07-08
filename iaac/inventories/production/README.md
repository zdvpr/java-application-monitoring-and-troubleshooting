Playbook for production hosts
=============================

Setup corporate proxy
---------------------
```cygwin shell
export http_proxy=http://USER:PASSWORD@proxy-gw.raiffeisen.ru:8080
export https_proxy=http://USER:PASSWORD@proxy-gw.raiffeisen.ru:8080
```

Smoke test Ansible connections
------------------------------
```cygwin shell
ansible -i inventories/production -m shell -a 'uname -a' all --ask-pass --ask-become-pass
ansible -i inventories/production -m shell -a 'cat /etc/os-release' all --ask-pass --ask-become-pass 
```

Run playbook against production hosts inventory
-----------------------------------------------
```cygwin shell
ansible-playbook site.yml -i inventories/production --ask-pass --ask-become-pass
```
