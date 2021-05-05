#!/bin/bash
# by default centos 7 comes with systemd but needs some mods to run correctly
# we'll take care of that first, using a custom dockerfile in centos_with_systemd

# git is probobly installed if this script is working, but just in case!:wq
yum -y install git

# start by pulling down the centos7 image
docker pull centos:7

# change into the subdir where the dockerfile for the
# systemd image creation lives
cd centos_with_systemd/

docker build --rm -t local/c7-systemd .

cd ..

docker build --rm -t local/c7-systemd-httpd-php .

docker run -ti --privileged=true -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-httpd-php

