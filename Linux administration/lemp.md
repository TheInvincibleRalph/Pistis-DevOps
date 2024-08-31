```bash
vagrant@vagrant:~$ sudo apt update
sudo apt install nginx
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Fetched 257 kB in 3s (90.6 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
1 package can be upgraded. Run 'apt list --upgradable' to see it.
vagrant@vagrant:~$ sudo apt install nginx
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  fontconfig-config fonts-dejavu-core libdeflate0 libfontconfig1 libgd3
  libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-geoip2
  libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter
  libnginx-mod-mail libnginx-mod-stream libnginx-mod-stream-geoip2
  libtiff5 libwebp7 libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxpm4
  nginx-common nginx-core
Suggested packages:
  libgd-tools fcgiwrap nginx-doc ssl-cert
The following NEW packages will be installed:
  fontconfig-config fonts-dejavu-core libdeflate0 libfontconfig1 libgd3
  libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-geoip2
  libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter
  libnginx-mod-mail libnginx-mod-stream libnginx-mod-stream-geoip2
  libtiff5 libwebp7 libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxpm4
  nginx nginx-common nginx-core
0 upgraded, 25 newly installed, 0 to remove and 1 not upgraded.
Unpacking fontconfig-config (2.13.1-4.2ubuntu5) ...
Selecting previously unselected package libdeflate0:amd64.
Preparing to unpack .../07-libdeflate0_1.10-2_amd64.deb ...
Unpacking libdeflate0:amd64 (1.10-2) ...
Selecting previously unselected package libfontconfig1:amd64.
Preparing to unpack .../08-libfontconfig1_2.13.1-4.2ubuntu5_amd64.deb ...
Unpacking libfontconfig1:amd64 (2.13.1-4.2ubuntu5) ...
Selecting previously unselected package libjpeg-turbo8:amd64.
Preparing to unpack .../09-libjpeg-turbo8_2.1.2-0ubuntu1_amd64.deb ...
Unpacking libjpeg-turbo8:amd64 (2.1.2-0ubuntu1) ...
Selecting previously unselected package libjpeg8:amd64.
Preparing to unpack .../10-libjpeg8_8c-2ubuntu10_amd64.deb ...
...
...
...
vagrant@vagrant:~$ sudo ufw app list
Available applications:
  Nginx Full
  Nginx HTTP
  Nginx HTTPS
  OpenSSH
vagrant@vagrant:~$ sudo ufw allow 'Nginx HTTP'
Rules updated
Rules updated (v6)
vagrant@vagrant:~$ sudo ufw status
Status: inactive
vagrant@vagrant:~$ curl -4 icanhazip.com
102.88.81.88
vagrant@vagrant:~$ sudo mysql_secure_installation

Securing the MySQL server deployment.

Connecting to MySQL using a blank password.

VALIDATE PASSWORD COMPONENT can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD component?

Press y|Y for Yes, any other key for No:

Skipping password set for root as authentication with auth_socket is used by default.
If you would like to use password authentication instead, this can be done with the "ALTER_USER" command.
See https://dev.mysql.com/doc/refman/8.0/en/alter-user.html#alter-user-password-management for more information.

By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) :

 ... skipping.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) :

 ... skipping.
By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) :

 ... skipping.
Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) :

 ... skipping.
All done!
vagrant@vagrant:~$ sudo mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.39-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> exit
Bye
vagrant@vagrant:~$ sudo apt install php-fpm php-mysql
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  mailcap mime-support php-common php8.1-cli php8.1-common php8.1-fpm
  php8.1-mysql php8.1-opcache php8.1-readline
Suggested packages:
  php-pear
The following NEW packages will be installed:
  mailcap mime-support php-common php-fpm php-mysql php8.1-cli
  php8.1-common php8.1-fpm php8.1-mysql php8.1-opcache php8.1-readline
0 upgraded, 11 newly installed, 0 to remove and 1 not upgraded.
Need to get 5,354 kB of archives.
After this operation, 22.1 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
...
...
...
vagrant@vagrant:~$ sudo mkdir /var/www/localhost
vagrant@vagrant:~$ sudo chown -R $USER:$USER /var/www/localhost
vagrant@vagrant:~$ sudo nano /etc/nginx/sites-available/localhost
vagrant@vagrant:~$ sudo ln -s /etc/nginx/sites-available/localhost /etc/ngin
x/sites-enabled/
vagrant@vagrant:~$ sudo unlink /etc/nginx/sites-enabled/default
vagrant@vagrant:~$ sudo systemctl reload nginx
vagrant@vagrant:~$ nano /var/www/localhost/index.html
vagrant@vagrant:~$ nano /var/www/localhost/index.html
vagrant@vagrant:~$ sudo systemctl reload nginx
vagrant@vagrant:~$ sudo nano /etc/nginx/sites-available/localhost
vagrant@vagrant:~$ sudo systemctl reload nginx
vagrant@vagrant:~$ sudo systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor pre>
     Active: active (running) since Sat 2024-08-31 10:15:34 UTC; 10min ago
       Docs: man:nginx(8)
    Process: 12718 ExecReload=/usr/sbin/nginx -g daemon on; master_process >
   Main PID: 4532 (nginx)
      Tasks: 3 (limit: 2275)
     Memory: 5.3M
        CPU: 270ms
     CGroup: /system.slice/nginx.service
             ├─ 4532 "nginx: master process /usr/sbin/nginx -g daemon on; m>
             ├─12719 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" >
             └─12720 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" >


vagrant@vagrant:~$ nano /var/www/localhost/info.php
Aug 31 16:54:49 vagrant systemd[1]: Starting A high performance web server >
Aug 31 16:54:51 vagrant systemd[1]: Started A high performance web server a>
lines 1-17/17 (END)
vagrant@vagrant:~$ sudo systemctl enable nginx
Synchronizing state of nginx.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable nginx
vagrant@vagrant:~$ sudo ss -tuln | grep :80
tcp   LISTEN 0      511           0.0.0.0:80         0.0.0.0:*
vagrant@vagrant:~$ sudo ufw allow 'Nginx HTTP'
Skipping adding existing rule
Skipping adding existing rule (v6)
vagrant@vagrant:~$ sudo systemctl reload nginx
vagrant@vagrant:~$ sudo rm /var/www/localhost/info.php
```