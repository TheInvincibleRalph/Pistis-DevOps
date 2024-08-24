```bash
theinvincible@TheInvincible:~$ sudo useradd newuser
theinvincible@TheInvincible:~$ sudo passwd newuser
New password:
Retype new password:
passwd: password updated successfully
theinvincible@TheInvincible:~$ sudo groupadd newgroup
theinvincible@TheInvincible:~$ sudo usermod -aG newgroup newuser
theinvincible@TheInvincible:~$ id newuser
uid=1003(newuser) gid=1005(newuser) groups=1005(newuser),1006(newgroup)
theinvincible@TheInvincible:~$ getent group newgroup
newgroup:x:1006:newuser
theinvincible@TheInvincible:~$ usermod -d /new/home/directory newuser
usermod: Permission denied.
usermod: cannot lock /etc/passwd; try again later.
theinvincible@TheInvincible:~$ sudo usermod -d /new/home/directory newuser
theinvincible@TheInvincible:~$ sudo userdel -r newuser
userdel: newuser mail spool (/var/mail/newuser) not found
userdel: newuser home directory (/new/home/directory) not found
theinvincible@TheInvincible:~$ sudo groupdel -r newuser
groupdel: invalid option -- 'r'
Usage: groupdel [options] GROUP

Options:
  -h, --help                    display this help message and exit
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -f, --force                   delete group even if it is the primary group of a user
      --extrausers              Use the extra users database

theinvincible@TheInvincible:~$ sudo groupdel newgroup
theinvincible@TheInvincible:~$
```

- > `-a`-- appends the user to the supplemental GROUP(S) mentioned by the -G option without removing the user from other groups.
- > `-d`-- creates a new home directory for the user account.