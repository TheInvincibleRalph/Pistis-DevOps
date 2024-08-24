```bash
theinvincible@TheInvincible:~$ sudo apt update
[sudo] password for theinvincible:
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
...
Fetched 12.9 MB in 16s (792 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
62 packages can be upgraded. Run 'apt list --upgradable' to see them.
theinvincible@TheInvincible:~$ sudo apt install apache2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
apache2 is already the newest version (2.4.52-1ubuntu4.12).
0 upgraded, 0 newly installed, 0 to remove and 62 not upgraded.
theinvincible@TheInvincible:~$ sudo apt remove apache2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  apache2-data apache2-utils ssl-cert
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  apache2
0 upgraded, 0 newly installed, 1 to remove and 62 not upgraded.
After this operation, 548 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 82966 files and directories currently installed.)
Removing apache2 (2.4.52-1ubuntu4.12) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for ufw (0.36.1-4ubuntu0.1) ...
theinvincible@TheInvincible:~$ apt search keyword
Sorting... Done
Full Text Search... Done
acpica-tools/jammy 20200925-6 amd64
  ACPICA tools for the development and debug of ACPI tables

apt-xapian-index/jammy 0.51ubuntu1 all
  maintenance and search tools for a Xapian index of Debian packages

astropy-utils/jammy 5.0.2-1 all
  Command line tools from astropy

awstats/jammy-updates,jammy-security 7.8-2ubuntu0.22.04.1 all
  powerful and featureful web server log analyzer

cgvg/jammy 1.6.2-4 all
  command-line source browsing tool

cloud-enum/jammy 0.6-2 all
  Multi-cloud open source intelligence tool

convmv/jammy 2.05-1.1 all
  filename encoding conversion tool

cookietool/jammy 2.5-6 amd64
  suite of programs to help maintain a fortune database
...

theinvincible@TheInvincible:~$ dpkg --list
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-p>
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                                 Version                           >
+++-====================================-==================================>
ii  acl                                  2.3.1-1                           >
ii  adduser                              3.118ubuntu5                      >
ii  adwaita-icon-theme                   41.0-1ubuntu1                     >
ii  alsa-topology-conf                   1.2.5.1-2                         >
ii  alsa-ucm-conf                        1.2.6.3-1ubuntu1.11               >
rc  apache2                              2.4.52-1ubuntu4.12                >
ii  apache2-bin                          2.4.52-1ubuntu4.12                >
ii  apache2-data                         2.4.52-1ubuntu4.12                >
ii  apache2-utils                        2.4.52-1ubuntu4.12                >
ii  apparmor                             3.0.4-2ubuntu2.3                  >
ii  apport                               2.20.11-0ubuntu82.5               >
ii  apport-symptoms                      0.24                              >
ii  apt                                  2.4.11                            >
ii  apt-utils                            2.4.11                            >
ii  at-spi2-core                         2.44.0-3                          >
ii  attr                                 1:2.5.1-1build1                   >
ii  augeas-lenses                        1.13.0-1                          >
ii  base-files                           12ubuntu4.4                       >
ii  base-passwd                          3.5.52build1                      >
ii  bash                                 5.1-6ubuntu1.1                    >
ii  bash-completion                      1:2.11-5ubuntu1                   >
ii  bind9-dnsutils                       1:9.18.28-0ubuntu0.22.04.1        >
ii  bind9-host                           1:9.18.28-0ubuntu0.22.04.1        >
ii  bind9-libs:amd64                     1:9.18.28-0ubuntu0.22.04.1        >
ii  binutils                             2.38-4ubuntu2.6                   >
ii  binutils-common:amd64                2.38-4ubuntu2.6                   >
ii  binutils-x86-64-linux-gnu            2.38-4ubuntu2.6                   >
ii  bsdextrautils                        2.37.2-4ubuntu3.4                 >
ii  bsdmainutils                         12.1.7+nmu3ubuntu2                >
ii  bsdutils                             1:2.37.2-4ubuntu3.4               >
ii  btrfs-progs                          5.16.2-1                          >
ii  busybox-initramfs                    1:1.30.1-7ubuntu3                 >
ii  busybox-static                       1:1.30.1-7ubuntu3                 >
ii  byobu                                5.133-1                           >
ii  bzip2                                1.0.8-5build1                     >
theinvincible@TheInvincible:~$ sudo apt upgrade
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following packages were automatically installed and are no longer required:
  apache2-data apache2-utils ssl-cert
Use 'sudo apt autoremove' to remove them.
Get more security updates through Ubuntu Pro with 'esm-apps' enabled:
  redis-server libjs-jquery-ui php-twig redis-tools
Learn more about Ubuntu Pro at https://ubuntu.com/pro
The following NEW packages will be installed:
  ubuntu-pro-client
The following packages have been kept back:
  python3-update-manager update-manager-core
The following packages will be upgraded:
  apport apt apt-utils base-files busybox-initramfs busybox-static
  coreutils distro-info dpkg e2fsprogs exfatprogs iptables irqbalance
...
theinvincible@TheInvincible:~$
```