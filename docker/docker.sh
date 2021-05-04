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
