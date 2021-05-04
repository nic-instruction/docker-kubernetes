#!/bin/bash
# docker install startup script
# based on completed and working install, instructions https://docs.docker.com/engine/install/centos/
# follwoed by history | cut -d " " -f 5-

# install docker repo
yum -y install yum-utils
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo

# install and start docker
yum -y install docker-ce docker-ce-cli containerd.io
systemctl start docker

# make sure docker and containerd start on reboot

 systemctl enable docker
 systemctl enable containerd

# verify docker is running and can deploy containers

 dockerStatus=$(docker run hello-world | grep -c "Hello from Docker\!")
 
 if [ dockerStatus > 0 ]; then
    echo "Success"
 else
    echo "Something Went Wrong"
 fi

# enable log rotation for containers
# on my install it creats this file, but appending just in case it's already there...

echo '{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3" 
  }
}' >> /etc/docker/daemon.json

systemctl restart docker

