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

# generate admin pw and store it in a relatively safe place on the filesystem

yum -y install openssl
gitlabPass=$(openssl rand -base64 25)
echo $gitlabPass > /root/gitlabAdminPass
chmod 400 /root/gitlabAdminPass

# If you just want to do some poking around with the form, use:
# curl -k -L --request GET https://$externalIP
# -k tells curl to ignore the self signed cert, and -L tells it to follow the redirect

# use the admin pass to log in and set a new admin pass via curl (have not implemented yet, because it's not pressing)

# If you need a password for automation and to create runners without setting an admin pass take a look at /etc/gitlab/gitlab.rb
# get defulat admin pass with:
# sed -i"" "s#\# gitlab_rails\['initial_root_password.*#gitlab_rails\['initial_root_password'\] = \""${GITLAB_INITIAL_ROOT_PASSWD}"\"#g" /etc/gitlab/gitlab.rb
# or, for more security, set your own, but you'll really want to make this super temporary, even for automation.

# Now you can go and log in!  Fun times.
# though if you're on google cloud you will still need to configure postgres to use a different port.






