Building and starting Docker container(s) as emulated production host
=====================================================================

[If you want ready-to-go Docker image WITHOUT Ansible provisioning]
-------------------------------------------------------------------
Within `test-env-docker-compose.yml` 
1. remove line `build: .`
1. replace tag `clear` to `provisioned`


Build and start docker container(s)
-----------------------------------
```bash
docker-compose --file inventories/test/test-env-docker-compose.yml up --detach
```

Useful Docker commands
----------------------
- Show running containers
```bash
docker ps -a
```

- Log in to running container `prod`
```bash
ssh -p 2222 root@localhost #pwd:root
docker exec -it prod /bin/bash
```

- Stop docker container(s) saving image
```bash
docker-compose --file inventories/test/test-env-docker-compose.yml stop
```

- Start docker container(s) after stop 
```bash
docker-compose --file inventories/test/test-env-docker-compose.yml start
```

- Stop and remove image
```bash
docker-compose --file inventories/test/test-env-docker-compose.yml down
```


Provisioning docker container as `prod` with Ansible
====================================================

Install host dependencies [for MacOS host only]
-----------------------------------------------
```bash
brew install gnu-tar
```

Update role dependencies [first time or roles updated]
-------------------------------------------------------
```bash
ansible-galaxy install -r requirements.yml --ignore-certs --force
```

Reset ssh keys [if container have changed]
------------------------------------------
```bash
ssh-keygen -R '[localhost]:2222'
ssh-keygen -R '[127.0.0.1]:2222'
```

Smoke test Ansible connections
------------------------------
```bash
ansible -i inventories/test -m shell -a 'uname -a' all
ansible -i inventories/test -m shell -a 'cat /etc/os-release' all
```

Prepare for run [for MacOs host only]
-------------------------------------
```bash
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
```

Run playbook against docker host(s)
-----------------------------------
```bash
ansible-playbook site.yml -i inventories/test
```


The whole script
================
```startup
docker-compose --file inventories/test/test-env-docker-compose.yml up --detach && \
ssh-keygen -R '[localhost]:2222' && \
ssh-keygen -R '[127.0.0.1]:2222' && \
ansible -i inventories/test -m shell -a 'uname -a' all && \
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES && \
ansible-playbook site.yml -i inventories/test
```

```shutdown
docker-compose --file inventories/test/test-env-docker-compose.yml down -t 3
```