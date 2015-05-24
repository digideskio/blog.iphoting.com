--- 
permalink: /blog/archives/823-Getting-AirPrint-Working-Manually-on-Linux-CUPS.html
layout: post
title: Getting AirPrint Working Manually on Linux (CUPS)
date: 2011-08-03 14:00:49 +08:00
highlight: true
s9y_link: http://www.iphoting.com/blog/archives/823-Getting-AirPrint-Working-Manually-on-Linux-CUPS.html
categories: 
- computers
- AirPrint
- apple
- avahi
- bonjour
- cups
- iOS
- linux
- printing
---
<p><em>I realised that I don&#8217;t have a post on configuring AirPrint on this blog, so here it is.</em></p>

<p>If you are inexperience with the command line and have the printer configured on a Mac, you may be better off with <a onclick="_gaq.push(['_trackPageview', '/extlink/www.ecamm.com/mac/printopia/']);"  href="http://www.ecamm.com/mac/printopia/">Printopia</a>. If your printer is connected to an AirPort Extreme or Time Capsule and you want to set up AirPrint via a CUPS server and Bonjour, please refer to my <a onclick="_gaq.push(['_trackPageview', '/extlink/tumblr.iphoting.com/post/2091486916/airprint-cups-on-linux-and-airport-extreme-bonjour']);"  href="http://tumblr.iphoting.com/post/2091486916/airprint-cups-on-linux-and-airport-extreme-bonjour">post on Tumblr</a>.</p>

<p>Otherwise, if you want to AirPrint-enable the printers connected to your Linux server (via CUPS), read on.</p>

<p>Requirements:</p>

<ul>
<li><a onclick="_gaq.push(['_trackPageview', '/extlink/en.wikipedia.org/wiki/Avahi_(software)']);"  href="http://en.wikipedia.org/wiki/Avahi_(software)">Avahi</a> (Bonjour implementation on Linux)</li>
<li><a onclick="_gaq.push(['_trackPageview', '/extlink/www.cups.org/']);"  href="http://www.cups.org/">CUPS</a></li>
<li><a onclick="_gaq.push(['_trackPageview', '/extlink/www.atxconsulting.com/blog/tjfontaine/2010/11/21/automatically-generate-airprint-avahi-service-files-cups-printers']);"  href="http://www.atxconsulting.com/blog/tjfontaine/2010/11/21/automatically-generate-airprint-avahi-service-files-cups-printers">CUPS to Avahi Service Files Generator</a></li>
</ul>

<p>First things first, please ensure that you are able to print a &#8216;Test Page&#8217; directly from the CUPS administration page, i.e. <a onclick="_gaq.push(['_trackPageview', '/extlink/localhost:631/']);"  href="http://localhost:631/">http://localhost:631/</a>. When you are at the Administrative Page, go to Printers -> Printer Name -> Maintenance -> Print Test Page. If there&#8217;s an issue with printing a Test Page, please troubleshoot the issue first before continuing with this post.</p>

<p>Once out of the way, generate the Avahi service file using the <a onclick="_gaq.push(['_trackPageview', '/extlink/www.atxconsulting.com/blog/tjfontaine/2010/11/21/automatically-generate-airprint-avahi-service-files-cups-printers']);"  href="http://www.atxconsulting.com/blog/tjfontaine/2010/11/21/automatically-generate-airprint-avahi-service-files-cups-printers">python script by tjfontaine</a>. Place the generated .service files into /etc/avahi/services/.</p>

<p>Then, you&#8217;ll be able to see your printer(s) listed on the iOS printer selection dialog.</p>

<p><img src="http://iphoting.iphoting.com/upload/AirPrint-20101204-123801.png" alt="iOS Printer Selection Dialog" height="400"></p>

<p>A peculiarity of iOS AirPrint is that devices have no printing configuration, except for a 2-sided printing On/Off switch. All printing is governed by the default configuration (as defined in CUPS) which is suitable for most users. But in my case, I decided to offer 4 different types of print services (as seen in the screenshot above), in the hope to save toner and to offer more printing choices.</p>

<p>The other printing options are purely duplicates of the original printer with different default options applied.</p>

<p>Let me know in the comments if you have any thoughts or suggestions.</p>
