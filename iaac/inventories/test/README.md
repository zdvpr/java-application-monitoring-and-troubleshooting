Building and starting Docker container(s) as emulated production host
=====================================================================

```bash
cd iaac
```

Build Docker image
------------------
```bash
docker build --tag java-monitoring-centos:8 inventories/test
```

Start docker container
-----------------------------------
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml up --detach
```

Useful Docker commands
----------------------
- Show running containers
```bash
docker ps -a
```

- Log in to running container `prod`
```bash
docker exec -it java-monitoring-prod /bin/bash
```

- Stop docker container(s) saving image
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml stop
```

- Start docker container(s) after stop
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml start
```

- Stop and remove image
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml down
```


Provisioning docker container as `prod` with Ansible
====================================================

Install host dependencies [for MacOS host only]
-----------------------------------------------
```bash
brew install gnu-tar
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
