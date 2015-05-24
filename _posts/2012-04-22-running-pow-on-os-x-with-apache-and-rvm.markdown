---
layout: post
title: "Running Pow on OS X with Apache and RVM"
date: 2012-04-22 16:07
highlight: true
comments: true
categories: [mac, osx, apache, pow, ruby, rvm, development, computers]
---
*Update: Expanded Troubleshooting section to include the most common RVM error.*

*Update 2: Changed certain sections for Pow 0.4.0.*

*Update 3: Updated `.powrc` to support `.ruby-version` in newer RVM versions*

Recently, I came across this wonderful Ruby web development tool called [Pow][].

> Pow is a zero-config Rack server for Mac OS X.

It is so awesome. To have your Rack app setup, just add a symlink to `~/.pow` and it'll be available at `http://myapp.dev/`. `myapp` is the name of the symlink you have used.

It is super easy to install, but there are some catches if your setup falls into one of the following:-

- You use RVM to manage your Ruby installations.
- You want system Apache to continue functioning. (By default, Pow takes over port 80.)

## Installing Pow
With reference to the "[Running Pow with Apache][2]" wiki article, here are some changes that I made to with respect to the instructions listed in the wiki page.

* Configure Pow (before installation)

	Here's how my `.powconfig` looks like:

```bash
export POW_TIMEOUT=120
export POW_WORKERS=1
export POW_DST_PORT=8300
export POW_RVM_PATH="/usr/local/rvm/scripts/rvm"
```
	
I prefer to use port 8300, but you can use port 88 as suggested in the wiki page.
	Also, ensure that your `POW_RVM_PATH` variable points to the correct location—it defaults to `~/.rvm/scripts/rvm`.

* Install Pow

	If you already have pow installed, uninstall it first:

		curl get.pow.cx/uninstall.sh | sh

	Then, install pow:

		curl get.pow.cx | sh

## Configuring Apache

Add the following file into `/etc/apache2/other/zzz-pow.conf`:

{% gist 2918423 zzz_pow.conf %}

This tells Apache to proxy all requests for `*.dev` to pow running at `localhost:20559`. The file starts with `zzz-` as this will ensure that this configuration snippet is included into apache last.

Restart/Start apache for it to take effect:

	$ sudo apachectl restart

## RVM
Due to some changes in newer versions of RVM, Pow is no longer able to automatically configure itself for RVM. You'll need to have a `.powrc` (commit this file into VCS) within your app directory to have RVM kick in *(updated to support `.ruby-version` in newer RVM versions)*:

```
if [ -f "$rvm_path/scripts/rvm" ] && [ -f ".rvmrc" ] ; then
  source "$rvm_path/scripts/rvm"
  source ".rvmrc"
elif [ -f "$rvm_path/scripts/rvm" ] && [ -f ".ruby-version" ] && [ -f ".ruby-gemset" ] ; then
  source "$rvm_path/scripts/rvm"
  rvm use `cat .ruby-version`@`cat .ruby-gemset`
elif [ -f "$rvm_path/scripts/rvm" ] && [ -f ".ruby-version" ] ; then
  source "$rvm_path/scripts/rvm"
  rvm use `cat .ruby-version`
fi
```

Once done, your rack applications will coexist with your current Apache setup peacefully.

## Troubleshooting

There's a very common Pow/RVM error:

	LoadError: cannot load such file -- bundler/setup
	[…]

The solution is simple, ensure that you have a `.powrc` file as per the RVM section above within the project directory. RVM support in Pow has been [removed or depreciated][5] and now made external.

For other errors, refer to the [Apache setup][3], and [Troubleshooting][4] wiki page for more details.

[pow]: http://pow.cx
[2]: https://github.com/37signals/pow/wiki/Running-Pow-with-Apache
[3]: https://github.com/37signals/pow/wiki/Running-Pow-with-Apache
[4]: https://github.com/37signals/pow/wiki/Troubleshooting
[5]: https://github.com/37signals/pow/pull/236
