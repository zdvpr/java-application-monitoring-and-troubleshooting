Building and starting Docker container(s) as emulated production host
=====================================================================

```bash
cd iaac
```

Build Docker image
------------------
```bash
docker build --tag java-monitoring-centos8:clear inventories/test
docker tag java-monitoring-centos8:clear java-monitoring-centos8:latest
```

Start clear/unprovisioned Docker image
--------------------------------------
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml up --detach
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

Save Docker image after provisioning
====================================
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml stop

docker commit java-monitoring-prod java-monitoring-centos8:provisioned
docker tag java-monitoring-centos8:provisioned java-monitoring-centos8:latest

docker-compose --file inventories/test/java-monitoring-prod-compose.yml down
```


Start provisioned docker container
==================================
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml up --detach
docker-compose ls -a
```

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

- Stop and remove container
```bash
docker-compose --file inventories/test/java-monitoring-prod-compose.yml down
```
