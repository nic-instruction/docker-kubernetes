FROM centos:7
# deltarpm gets installed to avoid build errors
# the enabling of httpd here is suprisingly important
# it causes it to start when the image is booted.
RUN yum -y install deltarpm httpd mod_php php-mysql mod_ssl; yum clean all; systemctl enable httpd.service 
# I'm sure I could just copy www/* but its nice to list everything out.
COPY www/index.html /var/www/html/
COPY www/insert.php /var/www/html/
COPY www/nic-example.php /var/www/html/
COPY www/nic-show-data.php /var/www/html/
CMD ["/usr/sbin/init"]
EXPOSE 80
