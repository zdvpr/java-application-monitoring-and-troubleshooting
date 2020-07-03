Playbook for production hosts
=============================

Install host dependencies [for MacOs host only]
-----------------------------------------------
```bash
brew install gnu-tar
```

Update role dependencies [first time or roles updated]
------------------------------------------------------
```bash
ansible-galaxy install -r requirements.yml --ignore-certs
```

Reset ssh keys [if target host have changed]
--------------------------------------------
```bash
ssh-keygen -R {{ ansible_ssh_host }}
```

Smoke test Ansible connections
------------------------------
```bash
ansible -i inventories/production -m shell -a 'uname -a' all --ask-pass --ask-become-pass
ansible -i inventories/production -m shell -a 'cat /etc/os-release' all --ask-pass --ask-become-pass 
```

Dry run [if IaaC have changed]
------------------------------
```bash
ansible-playbook site.yml -i inventories/production --check --ask-pass --ask-become-pass
```

Prepare for run [for MacOs host only]
-------------------------------------
```bash
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
```

Run playbook against production hosts inventory
-----------------------------------------------
```bash
ansible-playbook site.yml -i inventories/production --ask-pass --ask-become-pass
```
