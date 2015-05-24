--- 
permalink: /blog/archives/18-Brute-forced.html
layout: post
title: Brute-forced
date: 2005-02-07 22:08:12 +08:00
s9y_link: http://www.iphoting.com/blog/archives/18-Brute-forced.html
categories: 
- computers
- school
---
<p class="whiteline"><p>Here I&#8217;m, working on my English comprehension which was to be done on Friday (was absent), documenting the witness of some HK IP address, bruteforcing on my sshd (Secure SHell Daemon).</p>
</p><p class="whiteline"><p>I just upgraded my clamav to 0.82 (nice work clamav guys) and decided to check out my syslog for any signs of trouble from my clamav.</p>
</p><p class="whiteline"><p>To my horror upon tail -f, I saw hundreds, if not thousands, of ssh login failures via inexistent login names. Well, this obvious is something malicious. Therefore, I just copied the IP address down and issued shorewall drop <i>ip_address</i>. Done. I&#8217;ve just blacklisted that IP on my firewall and all packets from it will be dropped without condition. Peace and no more errors.</p>
</p><p class="whiteline"><p>After some thought, I think it&#8217;s dangerous. Had I not looked into my syslog, the cracker could have entered my machine via some weak account. So, I&#8217;ve decided to install Snort.</p>
</p><p class="break"><p>Now, my machine is busily compiling the latest snort SRPM whereas I&#8217;m writing this and my English comprehension summary.</p></p>
