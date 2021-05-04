#!/bin/bash
# GitLab install based on: https://about.gitlab.com/install/#centos-7

# postfix is already installed on google cloud by default, but must be configured on another port
# as google cloud blocks all traffic on port 25

yum -y install postfix
systemctl -y enable postfix
systemctl -y start postfix

# download the gitlab install script and run in bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | bash

# the gitlab--ee install will auto-request an ssl cert for your domain
# if you run without a domain, you can just use http and the external IP
# or stick with https for a self-signed cert (just warn the students that browsers will give it major side-eye)
# EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee

# find our external ip
externalIP=$(curl http://checkip.amazonaws.com/)

# use self signed cert and external ip
EXTERNAL_URL="https://$externalIP" yum -y install gitlab-ee
