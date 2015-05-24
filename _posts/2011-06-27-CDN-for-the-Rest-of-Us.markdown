--- 
permalink: /blog/archives/812-CDN-for-the-Rest-of-Us.html
layout: post
title: CDN for the Rest of Us
date: 2011-06-27 20:53:06 +08:00
s9y_link: http://www.iphoting.com/blog/archives/812-CDN-for-the-Rest-of-Us.html
categories: 
- computers
- thoughts
- cdn
- cloudflare
- dns
- internet
- technology
---
<p>Recently, I&#8217;ve been introduced to <a onclick="_gaq.push(['_trackPageview', '/extlink/cloudflare.com/']);"  href="http://cloudflare.com/">CloudFlare</a> in an <a onclick="_gaq.push(['_trackPageview', '/extlink/thenextweb.com/industry/2011/06/07/cloudflare-a-website-security-product-accidentally-makes-sites-60-faster/']);"  href="http://thenextweb.com/industry/2011/06/07/cloudflare-a-website-security-product-accidentally-makes-sites-60-faster/">article</a> on <a onclick="_gaq.push(['_trackPageview', '/extlink/thenextweb.com/']);"  href="http://thenextweb.com/">The Next Web</a>, and another article which I lost the link to that is along the lines of Coding Horror&#8217;s <a onclick="_gaq.push(['_trackPageview', '/extlink/www.codinghorror.com/blog/2011/06/performance-is-a-feature.html']);"  href="http://www.codinghorror.com/blog/2011/06/performance-is-a-feature.html">Performance is a Feature</a> article.</p>

<p>If you haven&#8217;t heard about Cloud Flare, it is a Content Distribution Network (CDN) with security features built-in. Available for free and affordably (with the Pro plan), for those who need greater security and site-protection features, and it can be used by anyone who owns a domain and has control over its nameservers, not just by the rich, large, and the powerful.</p>

<p>Just 9 days ago, they <a onclick="_gaq.push(['_trackPageview', '/extlink/blog.cloudflare.com/cloudflares-singapore-data-center-now-online']);"  href="http://blog.cloudflare.com/cloudflares-singapore-data-center-now-online">colocated</a> in Singapore, bringing CDN and speed benefits to us living in the South East Asia. With 11 other operational facilities around the world, with 2 more up-and-coming, Cloud Flare seems serious in the business of CDN.</p>

<p>Having enabled Cloud Flare for my site last night, the time taken to load my site has been greatly reduced, especially for visitors outside Singapore. I also used <a onclick="_gaq.push(['_trackPageview', '/extlink/loads.in/']);"  href="http://loads.in/">loads.in</a> to test my page load speeds and have found the results rather positive.</p>

<p>Although they claim that adopting the Cloud Flare service is easy and takes no longer than 5 minutes, it is only true for sites with a simple DNS zone file. Cloud Flare requires sites to adopt their nameservers in order to enable their services as it will allow them to seamlessly handle IP transitions without user intervention, putting their service between the web-visitors and your web-servers. As older sites are more complicated, additional time may be required during set-up as you will need to verify your zone files to ensure consistency when you switch DNS nameservers. The good thing is that it&#8217;s an one-off exercise that yields positive results, well worth the effort.</p>

<p>So, if you own a domain and would like to get some performance improvements to your site, why not give it a try?</p>
