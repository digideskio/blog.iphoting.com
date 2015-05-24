---
permalink: /blog/archives/833-Git-Hosting.html
layout: post
title: Git Hosting
date: 2011-11-27 01:39:00 +08:00
s9y_link: http://www.iphoting.com/blog/archives/833-Git-Hosting.html
categories:
- computers
- development
- git
---
[GitHub][] is an awesome place to host *public* [git][] repositories, absolutely free of charge. However, you will need at least a $7/month plan for 5 private repositories. That's quite expensive if the stuff you plan to host aren't that important or propriety and you just can't open source it.

For those of you who have no idea what git is all about, consider reading [The Git Parable][1] for a better understanding of what version control systems are all about.

In my search for a way to host my git repositories online but privately, I've come across this fantastic solution—[gitolite][]. It is in short an authentication and authorisation system for multiple git repositories. It also comes bundled with many cool features, such as repo mirroring, on-the-fly repository creation, self-service permission administration, just to name a few. This system is very well documented, and you can learn about its internals without ever having to dig through its source.

I now use it for all my projects that require versioning and it increased my usage of git tremendously.

If you would like an account to host your git repositories privately, feel free to drop me a line.

[GitHub]: http://github.com/
[git]: http://git-scm.com/
[gitolite]: https://github.com/sitaramc/gitolite
[1]: http://tom.preston-werner.com/2009/05/19/the-git-parable.html
