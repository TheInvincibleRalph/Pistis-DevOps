## Step-by-step documentation of installation step

```shell
theinvincible@TheInvincible:~$ vagrant
Command 'vagrant' not found, but can be installed with:
sudo apt install vagrant
theinvincible@TheInvincible:~$ sudo apt install vagrant
[sudo] password for theinvincible:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  acl adwaita-icon-theme alsa-topology-conf alsa-ucm-conf at-spi2-core
  attr augeas-lenses bsdmainutils btrfs-progs busybox-initramfs
  cpu-checker cryptsetup-bin db-util db5.3-util dconf-gsettings-backend
  dconf-service debootstrap dmeventd exfatprogs extlinux f2fs-tools fdisk
  finalrd fontconfig fonts-droid-fallback fonts-lato fonts-noto-mono
  fonts-urw-base35 gdisk ghostscript glib-networking
  glib-networking-common glib-networking-services
  gsettings-desktop-schemas gstreamer1.0-plugins-base
...
...
...
```

```shell
PS C:\Users\HP\Desktop> vagrant
Usage: vagrant [options] <command> [<args>]

    -h, --help                       Print this help.

Common commands:
     autocomplete    manages autocomplete installation on host
     box             manages boxes: installation, removal, etc.
     cloud           manages everything related to Vagrant Cloud
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
...
...
...

PS C:\Users\HP\Desktop> mkdir vagrant_getting_started


    Directory: C:\Users\HP\Desktop


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         8/21/2024   7:51 AM                vagrant_getting_started


PS C:\Users\HP\Desktop> cd .\vagrant_getting_started\
PS C:\Users\HP\Desktop\vagrant_getting_started> vagrant init hashicorp/bionic64
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
PS C:\Users\HP\Desktop\vagrant_getting_started> ls


    Directory: C:\Users\HP\Desktop\vagrant_getting_started


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         8/21/2024   7:53 AM           3469 Vagrantfile


PS C:\Users\HP\Desktop\vagrant_getting_started> Add-Content -Path .\Vagrantfile
cmdlet Add-Content at command pipeline position 1
Supply values for the following parameters:
Value[0]: Vagrant.configure("2") do |config|
Value[1]:   config.vm.box = "hashicorp/bionic64"
Value[2]: end
Value[3]:
PS C:\Users\HP\Desktop\vagrant_getting_started> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'hashicorp/bionic64' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Loading metadata for box 'hashicorp/bionic64'
    default: URL: https://vagrantcloud.com/api/v2/vagrant/hashicorp/bionic64
==> default: Adding box 'hashicorp/bionic64' (v1.0.282) for provider: virtualbox
    default: Downloading: https://vagrantcloud.com/hashicorp/boxes/bionic64/versions/1.0.282/providers/virtualbox/unknown/vagrant.box
    default:
==> default: Successfully added box 'hashicorp/bionic64' (v1.0.282) for 'virtualbox'!
...
...
...

PS C:\Users\HP\Desktop\vagrant_getting_started> vagrant ssh
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-58-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 System information disabled due to load higher than 1.0

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

0 packages can be updated.
0 updates are security updates.


vagrant@vagrant:~$ ls
vagrant@vagrant:~$ cd /
vagrant@vagrant:/$ ls
bin   home            lib64       opt   sbin  tmp      vmlinuz
boot  initrd.img      lost+found  proc  snap  usr      vmlinuz.old
dev   initrd.img.old  media       root  srv   vagrant
etc   lib             mnt         run   sys   var
vagrant@vagrant:/$ vagrant halt
-bash: vagrant: command not found
vagrant@vagrant:/$ ^C
vagrant@vagrant:/$ q
-bash: q: command not found
vagrant@vagrant:/$ exit
logout
Connection to 127.0.0.1 closed.
PS C:\Users\HP\Desktop\vagrant_getting_started> vagrant halt
==> default: Attempting graceful shutdown of VM...
PS C:\Users\HP\Desktop\vagrant_getting_started> vagrant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Destroying VM and associated drives...
PS C:\Users\HP\Desktop\vagrant_getting_started>
```