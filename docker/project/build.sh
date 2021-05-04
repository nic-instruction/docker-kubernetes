#!/bin/bash
# by default centos 7 comes with systemd but needs some mods to run correctly
# we'll take care of that first, using a custom dockerfile in centos_with_systemd

# start by pulling down the centos7 image
docker pull centos:7

# change into the subdir
cd centos_with_systemd/Dockerfile

docker build --rm -t /root/local/c7-systemd .
