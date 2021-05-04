#!/bin/bash
# GitLab install based on: https://about.gitlab.com/install/#centos-7

# postfix is already installed on google cloud by default, but must be configured on another port
# as google cloud blocks all traffic on port 25

yum -y install postfix
systemctl -y enable postfix
systemctl -y start postfix

# download the gitlab install script and run in bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | bash

# this will auto-request an ssl cert for your domain if you don't have one
# if you run without a domain, you can just use http and the external IP
# which is what we'll do here, because this is just a playground for me and my students
# EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee

# find our external ip
externalIP=$(curl http://checkip.amazonaws.com/)

# sub it in with http
EXTERNAL_URL="$externalIP" yum -y install gitlab-ee
