Building and starting Docker container(s) as emulated production host
=====================================================================

[If you want ready-to-go Docker image WITHOUT Ansible provisioning]
-------------------------------------------------------------------
Within `test-env-docker-compose.yml` 
1. remove line `build: .`
1. replace tag `clear` to `provisioned`


Build and start docker container(s)
---------------------------------------------
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

---

Provisioning docker container as `prod` with Ansible
====================================================

Install host dependencies [for MacOS host only]
-----------------------------------------------
```bash
brew install gnu-tar
```

Update dependency roles
-----------------------
```bash
ansible-galaxy install -r requirements.yml
```

Reset ssh keys [if container changed]
-------------------------------------
```bash
ssh-keygen -R 127.0.0.1
```

Smoke test Ansible connections
------------------------------
```bash
ansible -i inventories/test -m shell -a 'uname -a' all
```

Run playbook against docker host(s)
-----------------------------------
```bash
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES #for MacOSX only
ansible-playbook site.yml -i inventories/test
```
