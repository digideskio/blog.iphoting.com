---
layout: post
title: "Running JIRA on Amazon AWS EC2 Micro Instance"
date: 2012-06-02 16:52
highlight: true
comments: true
categories: [atlassian, JIRA, AWS, EC2, amazon, computers]
---
[JIRA][] is my favourite issue/bug tracker. With a $10 starter license for 10 users, it is perfect for small groups looking to use a fully-featured and powerful issue tracker. However, this huge Java application requires hosting somewhere unless you are willing to pay them $10/mth for their hosted solution.

Fortunately, Amazon AWS EC2 offers a Micro Instance that can actually run JIRA. Unfortunately, JIRA will not work out-of-the-box and you will get the JIRA is Locked, core plugins not loaded errors.

This is because the CPU scheduler in an EC2 micro instance will throttle down the CPU speed of the instance when it detects high CPU usage over a period of time. (This peculiar behaviour is [documented][docs] by Amazon.) With a slower CPU, the various core plugins to take longer than the default 60 seconds to load, and thus timeout, leaving JIRA to disable them. With core plugins disabled, JIRA enters a locked state, refusing to start.

The solution is simple—extend the plugin loading timeout to 300 seconds. This is governed by the undocumented `-Datlassian.plugins.enable.wait=300` parameter.

First, edit `<JIRA Install>/bin/setenv.sh` and add the parameter into the `JVM_SUPPORT_RECOMMENDED_ARGS` variable, like so:

``` bash
JVM_SUPPORT_RECOMMENDED_ARGS="-Datlassian.plugins.enable.wait=300"
```

Finally, start or restart JIRA for the changes to take effect. You should now see JIRA start up successfully, albeit taking much longer.

That being said, performance for 1-2 concurrent users should be reasonable. If not, upgrade to a larger instance.

### Credits
Found this solution from the following sources:

- [JIRA Bug #22633](https://jira.atlassian.com/browse/JRA-22633?focusedCommentId=236274&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-236274).
- <http://blog.networkedcollaboration.com/2012/03/20/increase-jira-plugin-timeout/>

[docs]: http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/concepts_micro_instances.html

[jira]: http://www.atlassian.com/software/jira/
