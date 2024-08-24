```bash
theinvincible@TheInvincible:~$ sudo apt update
[sudo] password for theinvincible:
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:3 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1987 kB]
Get:6 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1769 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [349 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [17.8 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [2384 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [410 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1112 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [260 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [26.0 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [92.4 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.1 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:17 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [31.4 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [16.5 kB]
Get:19 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [672 B]
Get:20 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en [290 kB]
Get:21 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [13.2 kB]
Get:22 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [2308 kB]
Get:23 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en [398 kB]
Get:24 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [890 kB]
Get:25 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [175 kB]
Get:26 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [19.0 kB]
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

ddgr/jammy 1.9-2 all
  DuckDuckGo from the terminal

develock-el/jammy 0.47-3.1 all
  additional font-lock keywords for the developers on Emacs

digikam/jammy 4:7.5.0-3fakesync1 amd64
  digital photo management application for KDE

elpa-find-file-in-project/jammy 6.0.7-1 all
  quick access to project files in Emacs

elpa-gitlab-ci-mode/jammy 20190824.12.2-2 all
  Emacs mode for editing GitLab CI files

elpa-helm-org/jammy 1.0-2 all
  Emacs Helm for Org-mode headlines and keywords completion

elpa-hl-todo/jammy 3.3.0-1 all
  highlight TODO and similar keywords in comments and strings

elpa-magit-todos/jammy 1.5.3-1 all
  show source file TODOs in Magit

elpa-php-mode/jammy 1.24.0-1 all
  PHP Mode for GNU Emacs

elpa-use-package-chords/jammy 2.4.1-1 all
  key-chord keyword for use-package

elpa-use-package-ensure-system-package/jammy 2.4.1-1 all
  autoinstall system packages

embassy-domsearch/jammy 1:0.1.660-3 amd64
  Extra EMBOSS commands to search for protein domains

fuzzyocr/jammy 3.6.0-15 all
  spamassassin plugin to check image attachments

gdl-mpfit/jammy 1.85+2017.01.03-4 all
  Robust non-linear least squares curve fitting for GDL

geany-plugin-doc/jammy 1.38+dfsg-1 amd64
  documentation plugin for Geany

googler/jammy 4.3.2-1 all
  Power tool to Google (Web & News) and Google Site Search from the terminal

htdig/jammy 1:3.2.0b6-19 amd64
  web search and indexing system - binaries

iraf-wcstools/jammy 3.9.6-1 all
  Handle the WCS of a FITS image (IRAF package)

irssi-scripts/jammy 20201016 all
  collection of scripts for irssi

kbibtex/jammy 0.9.90-1build1 amd64
  BibTeX editor for KDE

kbibtex-data/jammy 0.9.90-1build1 all
  BibTeX editor for KDE -- common data

kcemu/jammy 0.5.1+git20141014+dfsg-2build2 amd64
  KC 85/4 emulator

kcemu-common/jammy 0.5.1+git20141014+dfsg-2build2 all
  KC 85/4 emulator - common files

kde-zeroconf/jammy 4:21.12.3-0ubuntu1 amd64
  zeroconf plugins and kio slaves for KDE

kphotoalbum/jammy 5.8.1-2 amd64
  tool for indexing, searching and viewing images by keywords for KDE

lhs2tex/jammy 1.24-1build2.1 amd64
  Generates LaTeX code from literate Haskell sources

libauto64fto32f-java/jammy 1.4+ds-2 all
  minimalist library for converting double numerical Java code into float

libautobox-core-perl/jammy 1.33-1 all
  module providing automatic methods for core functions

libautobox-junctions-perl/jammy 0.002-1 all
  module providing autoboxified junction-style operators

libb-keywords-perl/jammy 1.23-1 all
  lists of internal perl keywords

libboost-context-dev/jammy 1.74.0.3ubuntu7 amd64
  provides a sort of cooperative multitasking on a single thread (default version)

libboost-context1.74-dev/jammy 1.74.0-14ubuntu3 amd64
  provides a sort of cooperative multitasking on a single thread

libboost-context1.74.0/jammy 1.74.0-14ubuntu3 amd64
  provides a sort of cooperative multitasking on a single thread

libccp4-data/jammy 6.5.1-5 all
  CCP4 core functionality - common files

libccp4-dev/jammy 6.5.1-5 amd64
  CCP4 core functionality - development files

libccp4c0/jammy 6.5.1-5 amd64
  CCP4 core functionality - C runtime

libccp4f0/jammy 6.5.1-5 amd64
  CCP4 core functionality - fortran runtime

libclass-tiny-antlers-perl/jammy 0.024-2 all
  Moose-like sugar for Class::Tiny

libcpl-dev/jammy 7.1.4+ds-1 amd64
  ESO library for automated astronomical data-reduction

libdancer-plugin-database-perl/jammy 2.13-1.1 all
  Dancer plugin providing easy database connections

libdancer2-plugin-ajax-perl/jammy 0.400000-1.1 all
  Dancer2 plugin for adding Ajax route handlers

libdancer2-plugin-database-perl/jammy 2.17-1 all
  module for easy database connections for Dancer2 applications

libdata-table-perl/jammy 1.78-1 all
  module to manipulate data tables in perl (as in R)

libdeclare-constraints-simple-perl/jammy 0.03-1.1 all
  module for declarative validation of data structures

libdevel-callparser-perl/jammy 0.002-4build5 amd64
  custom parsing attached to subroutines

libdevel-declare-perl/jammy 0.006022-1build2 amd64
  module to add new syntax to Perl

libexception-class-trycatch-perl/jammy 1.13-1.1 all
  syntactic try/catch sugar for use with Exception::Class

libexporter-renaming-perl/jammy 1.19-2.1 all
  facility to rename symbols when imported

libfeature-compat-try-perl/jammy 0.04-2 all
  make try/catch syntax available

libfunction-parameters-perl/jammy 2.001003-2build4 amd64
  module for subroutine definitions with parameter lists

libfuture-asyncawait-perl/jammy 0.56-1build1 amd64
  deferred subroutine syntax for futures

libghc-sql-words-dev/jammy 0.1.6.4-1build2 amd64
  SQL keywords data constructor into OverloadedString

libghc-sql-words-doc/jammy 0.1.6.4-1build2 all
  SQL keywords data constructor into OverloadedString; documentation

libghc-sql-words-prof/jammy 0.1.6.4-1build2 amd64
  SQL keywords data constructor into OverloadedString; profiling libraries

libguard-perl/jammy 1.023-1build7 amd64
  Perl module providing safe cleanup using guard objects

libjs-emojify/jammy 1.1.0+dfsg-2 all
  JavaScript library converting Emoji keywords to images

libkeyword-simple-perl/jammy 0.04-2build2 amd64
  Perl module to define new keywords in pure Perl

liblexical-failure-perl/jammy 0.000007-2.1 all
  Perl module for user-selectable lexically-scoped failure signaling

liblexical-underscore-perl/jammy 0.004-1.1 all
  access your caller's lexical underscore

liblingua-stopwords-perl/jammy 0.12-1 all
  module with stop words for several languages

libmethod-signatures-perl/jammy 20170211-2 all
  method and function declarations with signatures and no source filter

libmicroba-java/jammy 1:0.4.4.3-5.1 all
  set of JFC (Swing) components

libmicroba-java-doc/jammy 1:0.4.4.3-5.1 all
  Documentation for libmicroba-java

libmoosex-declare-perl/jammy 0.43-1 all
  Moose extension providing a declarative syntax

libmoosex-method-signatures-perl/jammy 0.49-1 all
  Moose extension for method declarations with type constraints

libmoosex-poe-perl/jammy 0.215-2 all
  Moose wrapper around a POE::Session

libmoosex-role-parameterized-perl/jammy 1.11-1 all
  Moose extension providing parameterized roles

libmoox-struct-perl/jammy 0.020-1 all
  simple lightweight record-like structures making sounds like cows

libperl-prereqscanner-perl/jammy 1.024-1 all
  module for extracting prerequisites from Perl code

libperl6-form-perl/jammy 0.090-1.1 all
  Perl 5 implementation of the Perl 6 'form' built-in

libperldoc-search-perl/jammy 0.01-3.1 all
  Index and Search local Perl Documentation

libperlx-assert-perl/jammy 0.905-1 all
  yet another assertion keyword

libqfits0/jammy 6.2.0-8ubuntu2 amd64
  Library offering easy access to FITS files

librudecgi-dev/jammy 5.0.0-1.1ubuntu2 amd64
  C++ parser library for CGI applications - development libraries

librudecgi5v5/jammy 5.0.0-1.1ubuntu2 amd64
  C++ parser library for CGI applications - runtime

librunning-commentary-perl/jammy 0.000005-1.1 all
  Perl module to call system() with tracking messages

librust-proc-macro-crate-dev/jammy 1.1.0-1 amd64
  Replacement for crate (macro_rules keyword) in proc-macros - Rust source code

libscalar-list-utils-perl/jammy 1:1.61-1 amd64
  modules providing common scalar and list utility subroutines

libsoftware-licensemoreutils-perl/jammy 1.005-1 all
  More utilities and a summary for Software::License

libstruct-dumb-perl/jammy 0.12-1 all
  module to create simple lightweight record-like structures

libsub-wrappackages-perl/jammy 2.01-1 all
  module to wrap subroutines in packages

libsyntax-keyword-dynamically-perl/jammy 0.09-1build1 amd64
  module to dynamically change the value of a variable

libsyntax-keyword-gather-perl/jammy 1.003002-1 all
  syntax extension for the "gather" keyword

libsyntax-keyword-junction-perl/jammy 0.003008-1.1 all
  Perl6 style Junction operators in Perl5

libsyntax-keyword-match-perl/jammy 0.08-2build1 amd64
  match/case syntax plugin for perl

libsyntax-keyword-try-perl/jammy 0.26-1build1 amd64
  try/catch/finally syntax for perl

libsyntax-perl/jammy 0.004-1.1 all
  pragma for activating syntax extensions

libtest-mockdatetime-perl/jammy 0.02-2 all
  module to mock DateTime->now calls during tests

libtext-context-eitherside-perl/jammy 1.4-2.1 all
  Perl module to get context around a keyword

libverilog-perl/jammy 3.478-1build1 amd64
  framework providing Verilog support

libwcstools-dev/jammy 3.9.6-1 amd64
  Handle the WCS of a FITS image (development files)

libwcstools1/jammy 3.9.6-1 amd64
  Handle the WCS of a FITS image (shared library)

libxs-parse-keyword-perl/jammy 0.21-1build1 amd64
  XS functions to assist in parsing keyword syntax

libxs-parse-sublike-perl/jammy 0.16-1build1 amd64
  XS functions to assist in parsing sub-like syntax

mew/jammy 1:6.8-15 all
  mail reader supporting PGP/MIME for Emacs

mew-beta/jammy 7.0.50~6.8+0.20210625-2 all
  mail reader supporting PGP/MIME for Emacs (development version)

minitube/jammy 3.9.1-1 amd64
  Native YouTube client

missfits/jammy 2.8.0-5 amd64
  Basic maintenance and packaging tasks on FITS files

nama/jammy 1.216-1 all
  Ecasound-based multitrack recorder/mixer

node-ajv-keywords/jammy 3.5.2-2 all
  Custom JSON-Schema keywords for Ajv validator

node-color-convert/jammy 2.0.1-1 all
  Plain color conversion functions

node-colormin/jammy 1.1.2-6 all
  Turn a CSS color into its smallest representation

nowhere/jammy 110.79-6 amd64
  Translates programs from an extended Standard ML to Standard ML

pdfmod/jammy 0.9.1-8.2 all
  simple tool for modifying PDF documents

pdfmod-dbg/jammy 0.9.1-8.2 all
  simple tool for modifying PDF documents -- debugging symbols

pdfproctools/jammy 1.9.2-1 all
  PDF Processing Tools

perlindex/jammy 1.606-1.1 all
  Perl manual pages index and query application

perltidier/jammy 1.18-4 all
  tweaks to Perl::Tidy to support some syntactic sugar

pgformatter/jammy 5.2-1 all
  PostgreSQL SQL syntax beautifier

python-django-classy-tags-doc/jammy 3.0.0-1 all
  Class based template tags for Django projects (Documentation)

python-multipledispatch-doc/jammy 0.6.0-3 all
  documentation for multipledispatch

python-pytest-doc/jammy 6.2.5-1ubuntu2 all
  Simple, powerful testing in Python - Documentation

python-pytest-xprocess-doc/jammy 0.18.1-3 all
  pytest plugin for managing processes across test runs - doc

python3-acora/jammy 2.2-1.3build4 amd64
  fast multi-keyword text search engine (Python 3)

python3-bottle-sqlite/jammy 0.2.0-1 all
  SQLite3 integration for Bottle - Python 3.x

python3-django-classy-tags/jammy 3.0.0-1 all
  Class based template tags for Django projects (Python3 version)

python3-doxypypy/jammy 0.8.8.6-4 all
  More Pythonic version of doxypy, a Doxygen filter for Python

python3-frozendict/jammy 1.2-3 all
  immutable dictionary - Python 3.x

python3-immutabledict/jammy 2.2.1-2 all
  immutable wrapper around dictionaries (fork of frozendict)

python3-injector/jammy 0.18.4-2 all
  Python dependency injection framework

python3-jsonrpclib-pelix/jammy 0.4.2-1 all
  Implementation of the JSON-RPC v2.0 specification (Python 3)

python3-legacy-api-wrap/jammy 1.2-3 all
  Legacy API wrapper for Python keyword only APIs

python3-ml-collections/jammy 0.1.0-2ubuntu1 all
  collections designed for ML usecases

python3-multipledispatch/jammy 0.6.0-3 all
  multiple dispatch in Python

python3-pafy/jammy 0.5.2-2.1 all
  Download videos and retrieve metadata from YouTube

python3-paypal/jammy 1.2.5-3 all
  PayPal API implementation (Python 3)

python3-pykcs11/jammy 1.5.10-1build2 amd64
  PKCS#11 wrapper for Python

python3-pytest/jammy 6.2.5-1ubuntu2 all
  Simple, powerful testing in Python3

python3-pytest-xprocess/jammy 0.18.1-3 all
  pytest plugin for managing processes across test runs

python3-textual/jammy 0.1.13-1 all
  TUI (Text User Interface) framework for Python inspired by modern web development

python3-wither/jammy 1.1-2 all
  XML/HTML Generation DSL (Python 3)

ruby-acts-as-taggable-on/jammy 8.1.0-2 all
  provides advanced tagging for Rails

ruby-forwardable-extended/jammy 2.6.0-1.1 all
  Forwardable with hash and instance variable extensions

ruby-jaeger-client/jammy 1.2.0-2 all
  OpenTracing Tracer implementation for Jaeger

ruby-numru-misc/jammy 0.1.2-2.1 all
  Miscellaneous functions and classes to help Ruby programming

ruby-ruby2-keywords/jammy 0.0.5-1 all
  source-level compatibility library between ruby2.7 and ruby3

search-ccsb/jammy 0.5-5 all
  BibTeX search tool

search-citeseer/jammy 0.3-3 all
  BibTeX search tool

texlive-latex-extra/jammy 2021.20220204-1 all
  TeX Live: LaTeX additional packages

texlive-science/jammy 2021.20220204-1 all
  TeX Live: Mathematics, natural sciences, computer science packages

vice/jammy 3.6.1+dfsg-2 amd64
  Versatile Commodore Emulator

vim-syntax-gtk/jammy 20110314-1.1 all
  Syntax files to highlight GTK+ keywords in vim

wcstools/jammy 3.9.6-1 amd64
  Handle the WCS of a FITS image

webext-form-history-control/jammy 2.5.1.0-1 all
  extension to manage form history

yokadi/jammy 1.2.0-3 all
  commandline todo system

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
  libapt-pkg6.0 libcom-err2 libcryptsetup12 libext2fs2 libip4tc2 libip6tc2
  libldap-2.5-0 libldap-common libnss-systemd liborc-0.4-0 libpam-systemd
  libpython3-stdlib libss2 libsystemd0 libudev1 libxtables12
  linux-libc-dev logsave motd-news-config python-apt-common python3
  python3-apport python3-apt python3-distro-info python3-distupgrade
  python3-minimal python3-problem-report python3-software-properties
  software-properties-common systemd systemd-hwe-hwdb systemd-sysv
  systemd-timesyncd tcpdump tzdata ubuntu-advantage-tools ubuntu-minimal
  ubuntu-pro-client-l10n ubuntu-release-upgrader-core ubuntu-standard
  ubuntu-wsl udev vim vim-common vim-runtime vim-tiny xxd
60 upgraded, 1 newly installed, 0 to remove and 2 not upgraded.
5 standard LTS security updates
Need to get 27.9 MB of archives.
After this operation, 158 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 motd-news-config all 12ubuntu4.6 [4352 B]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 base-files amd64 12ubuntu4.6 [62.5 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 coreutils amd64 8.32-4.1ubuntu1.2 [1437 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-timesyncd amd64 249.11-0ubuntu3.12 [31.2 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsystemd0 amd64 249.11-0ubuntu3.12 [319 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnss-systemd amd64 249.11-0ubuntu3.12 [133 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-sysv amd64 249.11-0ubuntu3.12 [10.5 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-systemd amd64 249.11-0ubuntu3.12 [203 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd amd64 249.11-0ubuntu3.12 [4581 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 udev amd64 249.11-0ubuntu3.12 [1557 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudev1 amd64 249.11-0ubuntu3.12 [78.2 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcryptsetup12 amd64 2:2.4.3-1ubuntu1.2 [211 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxtables12 amd64 1.8.7-1ubuntu5.2 [31.3 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 iptables amd64 1.8.7-1ubuntu5.2 [455 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libip6tc2 amd64 1.8.7-1ubuntu5.2 [20.3 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libip4tc2 amd64 1.8.7-1ubuntu5.2 [19.9 kB]
Get:17 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapt-pkg6.0 amd64 2.4.12 [912 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 dpkg amd64 1.21.1ubuntu2.3 [1239 kB]
Get:19 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apt amd64 2.4.12 [1363 kB]
Get:20 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apt-utils amd64 2.4.12 [211 kB]
Get:21 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 logsave amd64 1.46.5-2ubuntu1.2 [10.1 kB]
Get:22 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libext2fs2 amd64 1.46.5-2ubuntu1.2 [208 kB]
Get:23 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 e2fsprogs amd64 1.46.5-2ubuntu1.2 [590 kB]
Get:24 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-minimal amd64 3.10.6-1~22.04.1 [24.3 kB]
Get:25 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3 amd64 3.10.6-1~22.04.1 [22.8 kB]
Get:26 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3-stdlib amd64 3.10.6-1~22.04.1 [6812 B]
Get:27 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 irqbalance amd64 1.8.0-1ubuntu0.2 [47.2 kB]
Get:28 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcom-err2 amd64 1.46.5-2ubuntu1.2 [9304 B]
Get:29 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libss2 amd64 1.46.5-2ubuntu1.2 [12.3 kB]
Get:30 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 distro-info amd64 1.1ubuntu0.2 [18.7 kB]
Get:31 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python-apt-common all 2.4.0ubuntu3 [14.6 kB]
Get:32 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apt amd64 2.4.0ubuntu3 [164 kB]
Get:33 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 tzdata all 2024a-0ubuntu0.22.04.1 [349 kB]
Get:34 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-advantage-tools all 32.3.1~22.04 [10.9 kB]
Get:35 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client amd64 32.3.1~22.04 [209 kB]
Get:36 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 xxd amd64 2:8.2.3995-1ubuntu2.17 [53.7 kB]
Get:37 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 vim amd64 2:8.2.3995-1ubuntu2.17 [1734 kB]
Get:38 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 vim-tiny amd64 2:8.2.3995-1ubuntu2.17 [709 kB]
Get:39 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 vim-runtime all 2:8.2.3995-1ubuntu2.17 [6827 kB]
Get:40 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 vim-common all 2:8.2.3995-1ubuntu2.17 [81.5 kB]
Get:41 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-minimal amd64 1.481.3 [2742 B]
Get:42 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client-l10n amd64 32.3.1~22.04 [20.3 kB]
Get:43 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 busybox-static amd64 1:1.30.1-7ubuntu3.1 [1019 kB]
Get:44 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-distro-info all 1.1ubuntu0.2 [6554 B]
Get:45 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-release-upgrader-core all 1:22.04.19 [26.2 kB]
Get:46 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-distupgrade all 1:22.04.19 [106 kB]
Get:47 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 tcpdump amd64 4.99.1-3ubuntu0.2 [501 kB]
Get:48 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-standard amd64 1.481.3 [2764 B]
Get:49 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-problem-report all 2.20.11-0ubuntu82.6 [11.1 kB]
Get:50 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apport all 2.20.11-0ubuntu82.6 [89.0 kB]
Get:51 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apport all 2.20.11-0ubuntu82.6 [134 kB]
Get:52 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 busybox-initramfs amd64 1:1.30.1-7ubuntu3.1 [177 kB]
Get:53 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 exfatprogs amd64 1.1.3-1ubuntu0.1 [40.5 kB]
Get:54 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-2.5-0 amd64 2.5.18+dfsg-0ubuntu0.22.04.2 [183 kB]
Get:55 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-common all 2.5.18+dfsg-0ubuntu0.22.04.2 [15.9 kB]
Get:56 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 liborc-0.4-0 amd64 1:0.4.32-2ubuntu0.1 [228 kB]
Get:57 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-libc-dev amd64 5.15.0-119.129 [1318 kB]
Get:58 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 software-properties-common all 0.99.22.9 [14.1 kB]
Get:59 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-software-properties all 0.99.22.9 [28.8 kB]
Get:60 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-hwe-hwdb all 249.11.5 [3228 B]
Get:61 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-wsl amd64 1.481.3 [2586 B]
Fetched 27.9 MB in 35s (801 kB/s)
Extracting templates from packages: 100%
Preconfiguring packages ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../motd-news-config_12ubuntu4.6_all.deb ...
Unpacking motd-news-config (12ubuntu4.6) over (12ubuntu4.4) ...
Preparing to unpack .../base-files_12ubuntu4.6_amd64.deb ...
Unpacking base-files (12ubuntu4.6) over (12ubuntu4.4) ...
Setting up base-files (12ubuntu4.6) ...
Installing new version of config file /etc/issue ...
Installing new version of config file /etc/issue.net ...
Installing new version of config file /etc/lsb-release ...
Installing new version of config file /etc/update-motd.d/10-help-text ...
motd-news.service is a disabled or a static unit not running, not starting it.
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../coreutils_8.32-4.1ubuntu1.2_amd64.deb ...
Unpacking coreutils (8.32-4.1ubuntu1.2) over (8.32-4.1ubuntu1) ...
Setting up coreutils (8.32-4.1ubuntu1.2) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../systemd-timesyncd_249.11-0ubuntu3.12_amd64.deb ...
Unpacking systemd-timesyncd (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Preparing to unpack .../libsystemd0_249.11-0ubuntu3.12_amd64.deb ...
Unpacking libsystemd0:amd64 (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Setting up libsystemd0:amd64 (249.11-0ubuntu3.12) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../0-libnss-systemd_249.11-0ubuntu3.12_amd64.deb ...
Unpacking libnss-systemd:amd64 (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Preparing to unpack .../1-systemd-sysv_249.11-0ubuntu3.12_amd64.deb ...
Unpacking systemd-sysv (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Preparing to unpack .../2-libpam-systemd_249.11-0ubuntu3.12_amd64.deb ...
Unpacking libpam-systemd:amd64 (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Preparing to unpack .../3-systemd_249.11-0ubuntu3.12_amd64.deb ...
Unpacking systemd (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Preparing to unpack .../4-udev_249.11-0ubuntu3.12_amd64.deb ...
Unpacking udev (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Preparing to unpack .../5-libudev1_249.11-0ubuntu3.12_amd64.deb ...
Unpacking libudev1:amd64 (249.11-0ubuntu3.12) over (249.11-0ubuntu3.11) ...
Setting up libudev1:amd64 (249.11-0ubuntu3.12) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../0-libcryptsetup12_2%3a2.4.3-1ubuntu1.2_amd64.deb ...
Unpacking libcryptsetup12:amd64 (2:2.4.3-1ubuntu1.2) over (2:2.4.3-1ubuntu1.1) ...
Preparing to unpack .../1-libxtables12_1.8.7-1ubuntu5.2_amd64.deb ...
Unpacking libxtables12:amd64 (1.8.7-1ubuntu5.2) over (1.8.7-1ubuntu5.1) ...
Preparing to unpack .../2-iptables_1.8.7-1ubuntu5.2_amd64.deb ...
Unpacking iptables (1.8.7-1ubuntu5.2) over (1.8.7-1ubuntu5.1) ...
Preparing to unpack .../3-libip6tc2_1.8.7-1ubuntu5.2_amd64.deb ...
Unpacking libip6tc2:amd64 (1.8.7-1ubuntu5.2) over (1.8.7-1ubuntu5.1) ...
Preparing to unpack .../4-libip4tc2_1.8.7-1ubuntu5.2_amd64.deb ...
Unpacking libip4tc2:amd64 (1.8.7-1ubuntu5.2) over (1.8.7-1ubuntu5.1) ...
Preparing to unpack .../5-libapt-pkg6.0_2.4.12_amd64.deb ...
Unpacking libapt-pkg6.0:amd64 (2.4.12) over (2.4.11) ...
Setting up libapt-pkg6.0:amd64 (2.4.12) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../dpkg_1.21.1ubuntu2.3_amd64.deb ...
Unpacking dpkg (1.21.1ubuntu2.3) over (1.21.1ubuntu2.2) ...
Setting up dpkg (1.21.1ubuntu2.3) ...
dpkg-db-backup.service is a disabled or a static unit not running, not starting it.
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../archives/apt_2.4.12_amd64.deb ...
Unpacking apt (2.4.12) over (2.4.11) ...
Setting up apt (2.4.12) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../apt-utils_2.4.12_amd64.deb ...
Unpacking apt-utils (2.4.12) over (2.4.11) ...
Preparing to unpack .../logsave_1.46.5-2ubuntu1.2_amd64.deb ...
Unpacking logsave (1.46.5-2ubuntu1.2) over (1.46.5-2ubuntu1.1) ...
Preparing to unpack .../libext2fs2_1.46.5-2ubuntu1.2_amd64.deb ...
Unpacking libext2fs2:amd64 (1.46.5-2ubuntu1.2) over (1.46.5-2ubuntu1.1) ...
Setting up libext2fs2:amd64 (1.46.5-2ubuntu1.2) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../e2fsprogs_1.46.5-2ubuntu1.2_amd64.deb ...
Unpacking e2fsprogs (1.46.5-2ubuntu1.2) over (1.46.5-2ubuntu1.1) ...
Preparing to unpack .../python3-minimal_3.10.6-1~22.04.1_amd64.deb ...
Unpacking python3-minimal (3.10.6-1~22.04.1) over (3.10.6-1~22.04) ...
Setting up python3-minimal (3.10.6-1~22.04.1) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../python3_3.10.6-1~22.04.1_amd64.deb ...
running python pre-rtupdate hooks for python3.10...
Unpacking python3 (3.10.6-1~22.04.1) over (3.10.6-1~22.04) ...
Preparing to unpack .../libpython3-stdlib_3.10.6-1~22.04.1_amd64.deb ...
Unpacking libpython3-stdlib:amd64 (3.10.6-1~22.04.1) over (3.10.6-1~22.04) .
..
Preparing to unpack .../irqbalance_1.8.0-1ubuntu0.2_amd64.deb ...
Unpacking irqbalance (1.8.0-1ubuntu0.2) over (1.8.0-1ubuntu0.1) ...
Preparing to unpack .../libcom-err2_1.46.5-2ubuntu1.2_amd64.deb ...
Unpacking libcom-err2:amd64 (1.46.5-2ubuntu1.2) over (1.46.5-2ubuntu1.1) ...
Setting up libcom-err2:amd64 (1.46.5-2ubuntu1.2) ...
(Reading database ... 82917 files and directories currently installed.)
Preparing to unpack .../00-libss2_1.46.5-2ubuntu1.2_amd64.deb ...
Unpacking libss2:amd64 (1.46.5-2ubuntu1.2) over (1.46.5-2ubuntu1.1) ...
Preparing to unpack .../01-distro-info_1.1ubuntu0.2_amd64.deb ...
Unpacking distro-info (1.1ubuntu0.2) over (1.1ubuntu0.1) ...
Preparing to unpack .../02-python-apt-common_2.4.0ubuntu3_all.deb ...
Unpacking python-apt-common (2.4.0ubuntu3) over (2.4.0ubuntu2) ...
Preparing to unpack .../03-python3-apt_2.4.0ubuntu3_amd64.deb ...
Unpacking python3-apt (2.4.0ubuntu3) over (2.4.0ubuntu2) ...
Preparing to unpack .../04-tzdata_2024a-0ubuntu0.22.04.1_all.deb ...
Unpacking tzdata (2024a-0ubuntu0.22.04.1) over (2024a-0ubuntu0.22.04) ...
Preparing to unpack .../05-ubuntu-advantage-tools_32.3.1~22.04_all.deb ...
Unpacking ubuntu-advantage-tools (32.3.1~22.04) over (30~22.04) ...
dpkg: warning: unable to delete old directory '/var/lib/ubuntu-advantage': Directory not empty
dpkg: warning: unable to delete old directory '/etc/ubuntu-advantage': Directory not empty
Selecting previously unselected package ubuntu-pro-client.
Preparing to unpack .../06-ubuntu-pro-client_32.3.1~22.04_amd64.deb ...
Unpacking ubuntu-pro-client (32.3.1~22.04) ...
Preparing to unpack .../07-xxd_2%3a8.2.3995-1ubuntu2.17_amd64.deb ...
Unpacking xxd (2:8.2.3995-1ubuntu2.17) over (2:8.2.3995-1ubuntu2.16) ...
Preparing to unpack .../08-vim_2%3a8.2.3995-1ubuntu2.17_amd64.deb ...
Unpacking vim (2:8.2.3995-1ubuntu2.17) over (2:8.2.3995-1ubuntu2.16) ...
Preparing to unpack .../09-vim-tiny_2%3a8.2.3995-1ubuntu2.17_amd64.deb ...
Unpacking vim-tiny (2:8.2.3995-1ubuntu2.17) over (2:8.2.3995-1ubuntu2.16) ...
Preparing to unpack .../10-vim-runtime_2%3a8.2.3995-1ubuntu2.17_all.deb ...
Unpacking vim-runtime (2:8.2.3995-1ubuntu2.17) over (2:8.2.3995-1ubuntu2.16) ...
Preparing to unpack .../11-vim-common_2%3a8.2.3995-1ubuntu2.17_all.deb ...
Unpacking vim-common (2:8.2.3995-1ubuntu2.17) over (2:8.2.3995-1ubuntu2.16) ...
Preparing to unpack .../12-ubuntu-minimal_1.481.3_amd64.deb ...
Unpacking ubuntu-minimal (1.481.3) over (1.481.1) ...
Preparing to unpack .../13-ubuntu-pro-client-l10n_32.3.1~22.04_amd64.deb ...
Unpacking ubuntu-pro-client-l10n (32.3.1~22.04) over (30~22.04) ...
Preparing to unpack .../14-busybox-static_1%3a1.30.1-7ubuntu3.1_amd64.deb ...
Unpacking busybox-static (1:1.30.1-7ubuntu3.1) over (1:1.30.1-7ubuntu3) ...
Preparing to unpack .../15-python3-distro-info_1.1ubuntu0.2_all.deb ...
Unpacking python3-distro-info (1.1ubuntu0.2) over (1.1ubuntu0.1) ...
Preparing to unpack .../16-ubuntu-release-upgrader-core_1%3a22.04.19_all.deb ...
Unpacking ubuntu-release-upgrader-core (1:22.04.19) over (1:22.04.17) ...
Preparing to unpack .../17-python3-distupgrade_1%3a22.04.19_all.deb ...
Unpacking python3-distupgrade (1:22.04.19) over (1:22.04.17) ...
Preparing to unpack .../18-tcpdump_4.99.1-3ubuntu0.2_amd64.deb ...
Unpacking tcpdump (4.99.1-3ubuntu0.2) over (4.99.1-3ubuntu0.1) ...
Preparing to unpack .../19-ubuntu-standard_1.481.3_amd64.deb ...
Unpacking ubuntu-standard (1.481.3) over (1.481.1) ...
Preparing to unpack .../20-python3-problem-report_2.20.11-0ubuntu82.6_all.deb ...
Unpacking python3-problem-report (2.20.11-0ubuntu82.6) over (2.20.11-0ubuntu82.5) ...
Preparing to unpack .../21-python3-apport_2.20.11-0ubuntu82.6_all.deb ...
Unpacking python3-apport (2.20.11-0ubuntu82.6) over (2.20.11-0ubuntu82.5) ...
Preparing to unpack .../22-apport_2.20.11-0ubuntu82.6_all.deb ...
Unpacking apport (2.20.11-0ubuntu82.6) over (2.20.11-0ubuntu82.5) ...
Preparing to unpack .../23-busybox-initramfs_1%3a1.30.1-7ubuntu3.1_amd64.deb ...
Unpacking busybox-initramfs (1:1.30.1-7ubuntu3.1) over (1:1.30.1-7ubuntu3) .
..
Preparing to unpack .../24-exfatprogs_1.1.3-1ubuntu0.1_amd64.deb ...
Unpacking exfatprogs (1.1.3-1ubuntu0.1) over (1.1.3-1) ...
Preparing to unpack .../25-libldap-2.5-0_2.5.18+dfsg-0ubuntu0.22.04.2_amd64.deb ...
Unpacking libldap-2.5-0:amd64 (2.5.18+dfsg-0ubuntu0.22.04.2) over (2.5.16+dfsg-0ubuntu0.22.04.2) ...
Preparing to unpack .../26-libldap-common_2.5.18+dfsg-0ubuntu0.22.04.2_all.deb ...
Unpacking libldap-common (2.5.18+dfsg-0ubuntu0.22.04.2) over (2.5.16+dfsg-0ubuntu0.22.04.2) ...
Preparing to unpack .../27-liborc-0.4-0_1%3a0.4.32-2ubuntu0.1_amd64.deb ...
Unpacking liborc-0.4-0:amd64 (1:0.4.32-2ubuntu0.1) over (1:0.4.32-2) ...
Preparing to unpack .../28-linux-libc-dev_5.15.0-119.129_amd64.deb ...
Unpacking linux-libc-dev:amd64 (5.15.0-119.129) over (5.15.0-118.128) ...
Preparing to unpack .../29-software-properties-common_0.99.22.9_all.deb ...
Unpacking software-properties-common (0.99.22.9) over (0.99.22.8) ...
Preparing to unpack .../30-python3-software-properties_0.99.22.9_all.deb ...
Unpacking python3-software-properties (0.99.22.9) over (0.99.22.8) ...
Preparing to unpack .../31-systemd-hwe-hwdb_249.11.5_all.deb ...
Unpacking systemd-hwe-hwdb (249.11.5) over (249.11.3) ...
Preparing to unpack .../32-ubuntu-wsl_1.481.3_amd64.deb ...
Unpacking ubuntu-wsl (1.481.3) over (1.481.1) ...
Setting up libip4tc2:amd64 (1.8.7-1ubuntu5.2) ...
Setting up motd-news-config (12ubuntu4.6) ...
Setting up distro-info (1.1ubuntu0.2) ...
Setting up tcpdump (4.99.1-3ubuntu0.2) ...
Installing new version of config file /etc/apparmor.d/usr.bin.tcpdump ...
Setting up apt-utils (2.4.12) ...
Setting up irqbalance (1.8.0-1ubuntu0.2) ...
Setting up exfatprogs (1.1.3-1ubuntu0.1) ...
Setting up libip6tc2:amd64 (1.8.7-1ubuntu5.2) ...
Setting up linux-libc-dev:amd64 (5.15.0-119.129) ...
Setting up libldap-common (2.5.18+dfsg-0ubuntu0.22.04.2) ...
Setting up libldap-2.5-0:amd64 (2.5.18+dfsg-0ubuntu0.22.04.2) ...
Setting up xxd (2:8.2.3995-1ubuntu2.17) ...
Setting up tzdata (2024a-0ubuntu0.22.04.1) ...

Current default time zone: 'Africa/Lagos'
Local time is now:      Sat Aug 24 08:35:42 WAT 2024.
Universal Time is now:  Sat Aug 24 07:35:42 UTC 2024.
Run 'dpkg-reconfigure tzdata' if you wish to change it.

Setting up vim-common (2:8.2.3995-1ubuntu2.17) ...
Setting up busybox-static (1:1.30.1-7ubuntu3.1) ...
Setting up udev (249.11-0ubuntu3.12) ...
Setting up libss2:amd64 (1.46.5-2ubuntu1.2) ...
Setting up liborc-0.4-0:amd64 (1:0.4.32-2ubuntu0.1) ...
Setting up busybox-initramfs (1:1.30.1-7ubuntu3.1) ...
Setting up libxtables12:amd64 (1.8.7-1ubuntu5.2) ...
Setting up logsave (1.46.5-2ubuntu1.2) ...
Setting up systemd-hwe-hwdb (249.11.5) ...
Setting up python-apt-common (2.4.0ubuntu3) ...
Setting up libcryptsetup12:amd64 (2:2.4.3-1ubuntu1.2) ...
Setting up vim-runtime (2:8.2.3995-1ubuntu2.17) ...
Setting up libpython3-stdlib:amd64 (3.10.6-1~22.04.1) ...
Setting up vim (2:8.2.3995-1ubuntu2.17) ...
Setting up iptables (1.8.7-1ubuntu5.2) ...
Setting up e2fsprogs (1.46.5-2ubuntu1.2) ...
e2scrub_all.service is a disabled or a static unit not running, not starting it.
Setting up python3 (3.10.6-1~22.04.1) ...
running python rtupdate hooks for python3.10...
running python post-rtupdate hooks for python3.10...
Setting up systemd (249.11-0ubuntu3.12) ...
Setting up vim-tiny (2:8.2.3995-1ubuntu2.17) ...
Setting up systemd-timesyncd (249.11-0ubuntu3.12) ...
Setting up python3-distro-info (1.1ubuntu0.2) ...
Setting up systemd-sysv (249.11-0ubuntu3.12) ...
Setting up python3-problem-report (2.20.11-0ubuntu82.6) ...
Setting up python3-apt (2.4.0ubuntu3) ...
Setting up libnss-systemd:amd64 (249.11-0ubuntu3.12) ...
Setting up python3-distupgrade (1:22.04.19) ...
Setting up python3-apport (2.20.11-0ubuntu82.6) ...
Setting up python3-software-properties (0.99.22.9) ...
Setting up ubuntu-release-upgrader-core (1:22.04.19) ...
Setting up libpam-systemd:amd64 (249.11-0ubuntu3.12) ...
Setting up ubuntu-pro-client (32.3.1~22.04) ...
Setting up ubuntu-pro-client-l10n (32.3.1~22.04) ...
Setting up ubuntu-standard (1.481.3) ...
Setting up software-properties-common (0.99.22.9) ...
Setting up apport (2.20.11-0ubuntu82.6) ...
apport-autoreport.service is a disabled or a static unit, not starting it.
Setting up ubuntu-advantage-tools (32.3.1~22.04) ...
Setting up ubuntu-minimal (1.481.3) ...
Setting up ubuntu-wsl (1.481.3) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for plymouth-theme-ubuntu-text (0.9.5+git20211018-1ubuntu3) ...
Processing triggers for dbus (1.12.20-2ubuntu4.1) ...
Processing triggers for install-info (6.8-4build1) ...
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...
theinvincible@TheInvincible:~$
```