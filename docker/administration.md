# Administration

Based on the following docs
* https://docs.docker.com/engine/install/centos/

## Install a specific version

 Run: `yum list docker-ce --showduplicates | sort -r` to list the versions, then install by using the full version: `yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io`
 
 
