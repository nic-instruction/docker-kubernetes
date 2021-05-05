#!/bin/bash
echo "<?php
phpinfo ();
?>" > /var/www/html/info.php

systemctl enable httpd
systemctl start httpd

# prevent selinux from killing our db connection

setsebool -P httpd_can_network_connect_db=1

git clone https://github.com/nic-instruction/stuff.git

cp stuff/app/* /var/www/html/

