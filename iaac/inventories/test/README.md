Testing playbook with Docker test hosts
=======================================

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
ssh-keygen -R 127.0.0.1
```

Start docker test environment hosts inventory
---------------------------------------------
```bash
docker-compose --file inventories/test/test-env-docker-compose.yml up --detach
```

Smoke test Ansible connections
------------------------------
```bash
ansible -i inventories/test -m shell -a 'uname -a' all
```

Dry run [if ansible scripts've changed]
---------------------------------------
```bash
ansible-playbook site.yml -i inventories/test --check
```

Attach to running container `prod` [when needed]
------------------------------------------------
```bash
ssh -p 2222 root@localhost
docker exec -it prod /bin/bash
```

Run playbook against docker test environment hosts inventory
------------------------------------------------------------
```bash
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES #for MacOSX

ansible-playbook site.yml -i inventories/test
```

Stop docker test environment hosts inventory
--------------------------------------------
```bash
docker-compose --file inventories/test/test-env-docker-compose.yml down
```
