---
layout: post
title: "Upgrading to MySQL 5.5 on CentOS 6"
date: 2012-06-19 13:53
highlight: true
comments: true
categories: 
- computers
- linux
- yum
- rpm
- redhat
- centos
- MySQL
---

MySQL server shipped with CentOS 6 / RHEL 6 is still stuck at 5.1, which will soon be EOL. It will be prudent and sane to start preparing the migration to MySQL 5.5.

Here are the steps for the most sane and safe way to get MySQL 5.5 installed on a stock system (i.e. MySQL has not been installed yet, otherwise refer to the next section):

1. Install the following repos: [EPEL][], [RPMForge][], [IUS][], and [Remi][]. (The links provide an `xxx-release.rpm` package which sets up everything, look out for that and install them, one for each repo.)
2. Install `yum-plugin-replace`. This is required for step 8.
3. Enable yum plugins by editing `/etc/yum.conf` and adding `plugins=1`.
4. `yum update mysql-libs --enablerepo=remi`. Yum will fetch version 5.5 of mysql-libs from the remi repo.
5. `yum replace mysql-libs --replace-with mysql55-libs`. Yum will now replace `mysql-libs` from the remi repo with `mysql55-libs` from the ius repo.

	You may see the following: "WARNING: Unable to resolve all providers: ['libmysqlclient.so.18(libmysqlclient_18)(64bit)', 'mysql-libs(x86-64)']".

	Ignore it and choose continue.

6. `yum install mysql55-server mysql55`. Yum will now fetch version 5.5 of MySQL client and server packages from the ius repo.
7. Done.

If you already have MySQL 5.1 installed on the system with the distro packages, you will need to following steps 1-5 from above first, then proceed below:

First, identify all mysql related packages already installed:

```
$ rpm -qa | grep -i mysql
mysql-5.1.61-1.el6 2.1.x86_64
mysql-server-5.1.61-1.el6 2.1.x86_64
```

Then, drop into yum shell and remove and replace those packages within a single transaction:

```
# yum shell
remove mysql mysql-server
install mysql55 mysql55-server
transaction solve
transaction run
```

That's it. You should be able to successfully replace MySQL 5.1 packages with the 5.5 ones from the ius repository.

[EPEL]: http://fedoraproject.org/wiki/EPEL
[RPMForge]: http://wiki.centos.org/AdditionalResources/Repositories/RPMForge
[IUS]: http://iuscommunity.org/Repos
[Remi]: http://rpms.famillecollet.com/
