# Administration

Based on the following docs
* https://docs.docker.com/engine/install/centos/

## Install a specific version

 Run: `yum list docker-ce --showduplicates | sort -r` to list the versions, then install by using the full version: `yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io`
 
 ## Getting started tutorial
 
 `docker run -d -p 80:80 docker/getting-started`
 
* -d - run the container in detached mode (in the background)
* -p 80:80 - map port 80 of the host to port 80 in the container
* docker/getting-started - the image to use

* https://docs.docker.com/get-started/

## Useful administrative commands


List local images

```
docker images ls
```
List containers (running - by default)

```
docker container ls
```

List swarm secrets (run on the manager node to list the secrets of the swarm)

```
docker secret ls
```

List volumes

```
docker volume ls
```
