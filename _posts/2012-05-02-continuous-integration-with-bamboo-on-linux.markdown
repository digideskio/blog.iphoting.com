---
layout: post
title: "Continuous Integration with Bamboo on Linux"
date: 2012-05-02 00:10
highlight: true
comments: true
categories: [computers, agile, development, continuous integration]
---

Now that school's finally out, I've got some time to learn something about [continuous integration][ci] (CI), an integral part of agile development techniques. CI is all about applying QC and testing during development, as opposed to the end of development cycle for the waterfall development model.

So this means, whenever you commit anything into your code repository, your code should at the very least, compile. Following which, tests that were passing should continue to pass. Thirdly, any new tests that you've written should slowly turn from failure (red) to pass (green).

This way, when bugs were to inadvertently occur, resolution will be easier and quicker as the code is still fresh in the developer's mind—the older the bug gets, the longer it takes to identify and fix it.

For the open source world, [Travis CI][travis] offers a hosted CI environment. It supports a wide-range of languages and it's a breeze to use, as long as your code is hosted on [GitHub][]. Apart from Travis, I've seen [Jenkins][jk] and [CruiseControl][cc] being used, but I have not used either myself. CruiseControl looks much more difficult to configure and install than compared to Jenkins.

As [Atlassian][at] offers free classroom licenses for students, I've been using their [JIRA][] and [Confluence][cf] products in my projects and found their [Bamboo][] CI product a natural fit with good integration among other Atlassian products.

For a cost-free option, I've heard recommendations for [TeamCity][tc][^1]. It looks the most promising and a good competitor to Atlassian Bamboo.

## Starting Bamboo on Boot

Admittedly, documentation for Bamboo isn't perfect and a critical piece of information is missing—start-up scripts and launching bamboo as a non-root user.

Anyway, after some digging on Google and tweaking, here's a copy of the init script that I'm using:
{% include_code bamboo.sh %}

Remember to modify `BAMBOO_HOME`, `BAMBOO_INSTALL`, and `BAMBOO_USER` before using it. This script is modified to use the provided java service wrapper which provides auto-restarting functionality should the JVM hang.

## Bamboo with RVM and Ruby

The stock Bamboo installation has no support for RVM and complicated Ruby installations. Fortunately, Mark Wolfe has written an awesome [rake-bamboo-plugin][2] ([source][3]), which makes running Ruby, Bundler, and Rake tasks, on RVM possible.

***

[^1]: Free professional license with any downloaded TeamCity binary, and does not require any license key, limited to 20 build configurations, and 3 agents. Not open source.

[3]: https://github.com/wolfeidau/rake-bamboo-plugin
[2]: https://plugins.atlassian.com/plugins/au.id.wolfe.bamboo.rake-bamboo-plugin
[bamboo]: http://www.atlassian.com/software/bamboo/overview
[jira]: http://www.atlassian.com/software/jira/overview
[cf]: http://www.atlassian.com/software/confluence/overview
[at]: http://atlassian.com/
[tc]: http://www.jetbrains.com/teamcity/
[cc]: http://cruisecontrol.sourceforge.net/
[jk]: http://jenkins-ci.org/
[github]: http://github.com/
[travis]: http://travis-ci.org/
[ci]: http://en.wikipedia.org/wiki/Continuous_integration
