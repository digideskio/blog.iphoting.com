--- 
permalink: /blog/archives/814-Site-Performance-Enhancement.html
layout: post
title: Site Performance Enhancement
date: 2011-07-01 04:06:41 +08:00
s9y_link: http://www.iphoting.com/blog/archives/814-Site-Performance-Enhancement.html
categories: 
- computers
- thoughts
- apache
- development
- google
- httpd
- sysadmin
- technology
- web
---
<p>If you&#8217;re a frequent visitor, you may have noticed that my blog now loads much faster than before. Inspired by a post on Coding Horror that <a onclick="_gaq.push(['_trackPageview', '/extlink/www.codinghorror.com/blog/2011/06/performance-is-a-feature.html']);"  href="http://www.codinghorror.com/blog/2011/06/performance-is-a-feature.html">Performance is a Feature</a>, I happened to come across Google&#8217;s <a onclick="_gaq.push(['_trackPageview', '/extlink/pagespeed.googlelabs.com/']);"  href="http://pagespeed.googlelabs.com/">Page Speed Online</a> while reading up about site optimisation techniques.</p>

<p>I loaded my blog address onto Page Speed and was hopeful that the scores that were to come are much improved, considering that I had enabled <a onclick="_gaq.push(['_trackPageview', '/extlink/www.cloudflare.com/']);"  href="http://www.cloudflare.com/">CloudFlare</a> CDN for my blog. To much of my surprise, the speed check tool detected a few areas where further performance enhancements can be made to my site. Upon reading the suggestions in greater detail, I&#8217;ve picked up a few <a onclick="_gaq.push(['_trackPageview', '/extlink/code.google.com/speed/page-speed/docs/rules_intro.html']);"  href="http://code.google.com/speed/page-speed/docs/rules_intro.html">easily implementable techniques</a> that anyone can use for their sites.</p>

<p>There are a few key focus areas, namely optimising caching, minimising round trip times, minimising requests, and minimising payload size.</p>

<p>While digging deeper into the documentation, I found out that Google has released an Apache 2.2 module, <a onclick="_gaq.push(['_trackPageview', '/extlink/code.google.com/speed/page-speed/docs/module.html']);"  href="http://code.google.com/speed/page-speed/docs/module.html">mod_pagespeed</a>, to specifically automate some of these techniques. With this module, one can expect speed increases out-of-the-box, with minimal configuration.</p>

<p>After getting the module installed and running, I&#8217;m extremely surprised! My blog used to take approximately more than 6 seconds to load completely and it now takes only 3 seconds. A 50% speed increase!</p>

<p>Looking through the documentation further, there&#8217;s another technique to speed up site loading called domain sharding. Enabled it by adding a few CNAME records and tweaking a configuration setting, my site loaded even faster.</p>

<p>Now, on average in most locations, my site loads just under 3 seconds.</p>

<p>So, if you&#8217;re an Apache administrator, why not check mod_pagespeed out?</p>
