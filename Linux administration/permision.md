```bash
theinvincible@TheInvincible:~$ mkdir pistis
theinvincible@TheInvincible:~$ cd pistis/
theinvincible@TheInvincible:~/pistis$ touch example.txt
theinvincible@TheInvincible:~/pistis$ mkdir exampledir
theinvincible@TheInvincible:~/pistis$ ls -l
total 4
-rw-r--r-- 1 theinvincible theinvincible    0 Aug 24 08:13 example.txt
drwxr-xr-x 2 theinvincible theinvincible 4096 Aug 24 08:13 exampledir
theinvincible@TheInvincible:~/pistis$ chmod u+rw example.txt
theinvincible@TheInvincible:~/pistis$ ls -l
total 4
-rw-r--r-- 1 theinvincible theinvincible    0 Aug 24 08:13 example.txt
drwxr-xr-x 2 theinvincible theinvincible 4096 Aug 24 08:13 exampledir
theinvincible@TheInvincible:~/pistis$ chmod u+rwx example.txt
theinvincible@TheInvincible:~/pistis$ ls -l
total 4
-rwxr--r-- 1 theinvincible theinvincible    0 Aug 24 08:13 example.txt
drwxr-xr-x 2 theinvincible theinvincible 4096 Aug 24 08:13 exampledir
theinvincible@TheInvincible:~/pistis$ sudo groupadd pistisgroup
[sudo] password for theinvincible:
theinvincible@TheInvincible:~/pistis$ sudo add -m -G pistisgroup pistisuser
sudo: add: command not found
theinvincible@TheInvincible:~/pistis$ sudo useradd -m -G pistisgroup pistisuser
theinvincible@TheInvincible:~/pistis$ sudo chown pistisuser example.txt
theinvincible@TheInvincible:~/pistis$ ls -aux
.  exampledir  example.txt  ..
theinvincible@TheInvincible:~/pistis$ ls -l
total 4
-rwxr--r-- 1 pistisuser    theinvincible    0 Aug 24 08:13 example.txt
drwxr-xr-x 2 theinvincible theinvincible 4096 Aug 24 08:13 exampledir
theinvincible@TheInvincible:~/pistis$ sudo chown pistisuser exampledir
theinvincible@TheInvincible:~/pistis$ ls -l
total 4
-rwxr--r-- 1 pistisuser theinvincible    0 Aug 24 08:13 example.txt
drwxr-xr-x 2 pistisuser theinvincible 4096 Aug 24 08:13 exampledir
theinvincible@TheInvincible:~/pistis$ sudo chgrp pistisgroup example.txt
theinvincible@TheInvincible:~/pistis$ ls -l
total 4
-rwxr--r-- 1 pistisuser pistisgroup      0 Aug 24 08:13 example.txt
drwxr-xr-x 2 pistisuser theinvincible 4096 Aug 24 08:13 exampledir
theinvincible@TheInvincible:~/pistis$ sudo su pistisuser
$ ls
example.txt  exampledir
$
```