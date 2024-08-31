### Troubleshooting: How I solved my blockers

> Backstory: I prefer to work with linux on my Ubuntu workspace which runs directly on the Windows Subsystem for Linux environment (as opposed to using Windows CMD or Powershell) but I kept on running into a version disparity error between Windows and WSL as shown below:

```bash
theinvincible@TheInvincible:~$ vagrant up
Vagrant cannot currently enable access to manage machines within the Windows
environment because the version of Vagrant installed on Windows does not
match this version of Vagrant running within the Windows Subsystem for Linux.
Please ensure both installation of Vagrant are the same. If you do not want
update your Vagrant installations you can disable Windows access by unsetting
the `VAGRANT_WSL_ACCESS_WINDOWS_USER` environment variable.

  Windows Vagrant version: 2.4.1
  Windows Subsystem for Linux Vagrant version: 2.2.19
```

To resolve the error, I had the option of deprecating the Vagrant version on Windows from w.4.1 to 2.2.19 but I thought it was not going to be a good idea. So, I decided to upgrade the WSL version of vagrant instead.

I ran so many `sudo apt upgrade vagrant` but somehow it keeps telling me vagrant is in the latest version already (really?!):

```bash
theinvincible@TheInvincible:~$ sudo apt upgrade vagrant
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
vagrant is already the newest version (2.2.19+dfsg-1ubuntu1).
Calculating upgrade... Done
```

...and without an upgrade to the Window's 2.4.1 version, vagrant will refuse to respond (then the battle that took hours begun).

Fast forward, I eventually got my way around it (after trying out over 100 trials!). Here is how my sucessful 101th trial looks like:

### Steps to Install a Specific Version of Vagrant:

1. **Check Available Versions:**
   
   First, you need to see if the specific version of Vagrant is available in your `apt` repositories:

   ```bash
   apt list -a vagrant
   ```

  Here is what I got from this (poor apt):

```bash
Listing... Done
  vagrant/jammy 2.2.19+dfsg-1ubuntu1 all
```

Bacause `vagrant 2.4.1` is not listed in the available versions from the previous command, I had to go through manual installation.

2. **Manually Download and Install Vagrant:**

   - **Download the Vagrant Package:**

     ```bash
     wget https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1-1_amd64.deb
     ```

   - **Install the Downloaded Package:**

     Use `dpkg` to install the downloaded `.deb` package:

     ```bash
     sudo dpkg -i vagrant_2.4.1-1_amd64.deb
     ```

   - **Fix Dependencies (if necessary):**

     If `dpkg` reports missing dependencies, you can fix them using:

     ```bash
     sudo apt-get install -f
     ```

4. **Verify Installation:**

   After installation, verify that the correct version is installed by checking the version:

   ```bash
   vagrant --version
   Vagrant 2.4.1
   ```

   Voila! 

This method ensures that the installation a specific version of Vagrant when it is not directly available via `apt`. By manually downloading and installing the `.deb` package, the user maintain control over the installed version, which can be important for compatibility in certain environments like when using Vagrant in Windows Subsystem for Linux (WSL) with matching versions.

> Lesson: I didn't fail 100 times, I only found 100 ways it would not work (*call me Thomas Edison Jnr :)*)