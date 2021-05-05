#!/bin/bash
# Build and run the docker image

# build the docker image (from the Dockerfile in this dir)
docker build . -t appsrv:v1

# launch a docker image that will map externally to port 1234.
# note: you need to give it priveleges or it can't attach the volume
docker run -p 1234:80 --privileged=true -dit appsrv:v1

# if you want to run it interactively, remove the -d
# to get out of the interactive shell: ctrl-p ctrl-q
