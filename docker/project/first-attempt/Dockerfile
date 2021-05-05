FROM local/c7-systemd
RUN yum -y install httpd mod_php php-mysql mod_ssl unzip git; yum clean all;
COPY phpApp.sh /app/phpApp.sh
WORKDIR /app
CMD ["bash phpApp.sh"]
EXPOSE 80
CMD ["/usr/sbin/init"]
