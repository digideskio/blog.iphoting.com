--- 
permalink: /blog/archives/726-Optimisation.html
layout: post
title: Optimisation
date: 2008-12-30 17:01:35 +08:00
s9y_link: http://www.iphoting.com/blog/archives/726-Optimisation.html
categories: 
- computers
- thoughts
---
<p class="break"><p><img src="http://iphoting.iphoting.com/upload/Transfer_Speeds-20081230-170000.png" alt="" /></p><p class="whiteline">Such speeds are quite easy to achieve in BitTorrent, in an almost stock configuration with BitTornado client, with encryption turned on.</p>
</p><p class="whiteline"><p>I&#8217;m always wondering, why people keep talking about &#8216;settings&#8217;, for more decent speeds. I mean, there&#8217;s hardly anything you can tweak in the client that can give you speed boosts in the range of 100 kilobits and more. My hypothesis for their poor speeds is that they have poor hardware and network setup on which the BT client runs.</p>
</p><p class="whiteline"><p>I mean, it is rather common to hear BT clients running behind a consumer grade router, NAT&#8217;ed, conntrack&#8217;ed and all, but with very little memory and processing power on these embedded devices.</p>
</p><p class="whiteline"><p>So really, rather than the magic set of setting combinations, bottlenecks along the way such as tracking table sizes and modem capabilities should be ironed out. A quick and easy method is to use a professional-grade router. Or just replace the router with any micro-computer with sufficient amounts of RAM. Anything with 500MHz and more than 256mb of RAM can be an extremely powerful router for the home consumer. After all, the biggest bottleneck lies with your upstream provider and bandwidth.</p>
</p><p class="whiteline"><p>Only after which, one can then start with the art of managing one&#8217;s upstream bandwidth.</p>
</p><p class="whiteline"><p>The idea is this, (from my experience) leave at least 5 kb/s of upload bandwidth unused to allow for spikes, above and beyond the allocations by the QoS protocol and the calculated reserve bandwidth (more on that in a while). Generally, for every 15 kbps of download, there needs to be 1 kbps of unused upload bandwidth (8 kbps = 1 kb/s).</p>
</p><p class="whiteline"><p>Based on the above ratio of 15:1, assuming you&#8217;ll want to achieve 1500 kbps of download speed, you will need to have 100 kbps of upload bandwidth available, not in use by BT or anything else to upload data.</p>
</p><p class="whiteline"><p>To find the optimum setting for &#8216;max upload speed&#8217; in the BT client, find your maximum download bandwidth, divide it by 15, and you&#8217;ll get the reserve upload bandwidth you&#8217;ll need. Then take your maximum upload bandwidth and minus your reserve upload bandwidth, and you&#8217;ll get a &#8216;max upload speed&#8217; value for your BT client.</p>
</p><p class="whiteline"><p><!-- s9ymdb:91 --><img class="serendipity_image_center" src="http://iphoting.iphoting.com/upload/Eqn-upload-20090103-141305.png" alt="" /></p>
</p><p class="break"><p>Once you&#8217;ve got your bandwidth ratios worked out and balanced, you can then proceed on to tweak the max open connections and the max number of running transfers limits. The values of the above two keys would largely depend on the type of router and modem you&#8217;re using.</p></p>
