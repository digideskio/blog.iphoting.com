---
layout: post
title: "Apache and Mountain Lion"
date: 2012-07-30 16:53
comments: true
categories: 
- OSX
- mac
- apache
- computers
---

After upgrading to OS X 10.8, some of you might have noticed that the "Web Sharing" option is no longer available from the Sharing Panel of Systems Preferences.

Fear not!

While Apple has removed the user-interface (a mere checkbox) for Apache (the Web/HTTP service), it is still available and installed in Mountain Lion, fully functional.

To turn it on:

	$ sudo apachectl start

To turn it off:

	$ sudo apachectl stop

Apache configuration files are available in `/etc/apache2/`.

You might want to [use it][1] with [Pow][] if you do Ruby development.

[pow]: http://pow.cx/
[1]: {% post_url 2012-04-22-running-pow-on-os-x-with-apache-and-rvm %}
