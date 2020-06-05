Playbook for production hosts
=============================

Install host dependencies for MacOs
-----------------------------------
```bash
brew install gnu-tar
```

Update dependency roles
-----------------------
```bash
ansible-galaxy install -r requirements.yml
```

Reset ssh keys
--------------
```bash
ssh-keygen -R {{ ansible_ssh_host }}
```

Smoke test Ansible connections
------------------------------
```bash
ansible -i inventories/production -m shell -a 'uname -a' all
```

Dry run
-------
```bash
ansible-playbook site.yml -i inventories/production --check
```

Run playbook against docker test environment hosts inventory
------------------------------------------------------------
```bash
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES #for MacOSX
ansible-playbook site.yml -i inventories/production
```
