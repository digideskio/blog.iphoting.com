--- 
permalink: /blog/archives/768-Efficient-Speed.html
layout: post
title: Efficient Speed
date: 2009-10-06 19:54:39 +08:00
s9y_link: http://www.iphoting.com/blog/archives/768-Efficient-Speed.html
categories: 
- computers
- life
- thoughts
- Work
---
<p class="whiteline"><p>Yesterday, I was given an interesting problem to tackle.</p>
</p><p class="whiteline"><p>We were given a bunch of laptops, 8 of them to be exact, already cloned but missing almost 15 GB of important user-end data. There&#8217;s no way to re-clone all these machines, as the source image is not available to us. The only way is to copy the 15 GB of files to each machine, no two ways about it. The 15 GB of files lie on a 500 GB external USB harddisk. I have Ethernet cables and 2 Ethernet switches.</p>
</p><p class="whiteline"><p>The big question is how?</p>
</p><p class="whiteline"><p>Of course, copying from the harddisk onto each laptop one after another, manually, or via <a onclick="_gaq.push(['_trackPageview', '/extlink/en.wikipedia.org/wiki/Sneakernet']);"  href="http://en.wikipedia.org/wiki/Sneakernet">Sneakernet</a>, is the favourite answer, but no. I can only call that desperate, physically constrained, or intellectually apathetic.</p>
</p><p class="whiteline"><p>I&#8217;m a person who loves processes, systems, and automation. Having to copy a bunch of files serially and manually, and onto so many computers repetitively is unacceptable, especially when you have to rinse and repeat a whole 8 times. Suffering a little pain to get any infrastructure up, just to let it copy automatically painlessly is what I&#8217;m looking for. 先苦后甜.</p>
</p><p class="whiteline"><p>Out of ideas, I pinged a few people via sms, &#8220;Hey, what is the most efficient way to transfer 15 GB of data onto 8 different laptops, without cloning.&#8221;</p>
</p><p class="whiteline"><p>Portable Harddisk / Sneakernet, Samba CIFS were the few answers that came in. Someone suggested copying from one to two, two to four, four to eight, but that&#8217;s too tedious and not scalable, equipment wise. But what if the media used is the Ethernet?</p>
</p><p class="whiteline"><p>I probed further, &#8220;multicast network solutions?&#8221;</p>
</p><p class="whiteline"><p>&#8220;<a onclick="_gaq.push(['_trackPageview', '/extlink/en.wikipedia.org/wiki/BitTorrent_(protocol)']);"  href="http://en.wikipedia.org/wiki/BitTorrent_(protocol)">BitTorrent</a>&#8221;. Bingo. Thanks to cflee for that great suggestion! That&#8217;s the term and I knew it would certainly work. I did read up on the BitTorrent protocol some time back and am quite disappointed that this didn&#8217;t occur to me earlier. He also mentioned that <a onclick="_gaq.push(['_trackPageview', '/extlink/www.utorrent.com/']);"  href="http://www.utorrent.com/">uTorrent</a> provides a built-in tracker, and that there&#8217;s a <a onclick="_gaq.push(['_trackPageview', '/extlink/www.utorrent.com/documentation/make-a-torrent']);"  href="http://www.utorrent.com/documentation/make-a-torrent">handy guide</a> available.</p>
</p><p class="whiteline"><p>Spent 10 minutes reading through and successfully managed to give it a trial within my home network between 2 computers. Conceptually, a prototype has been demonstrated and there&#8217;s no way it can fail the next day.</p>
</p><p class="whiteline"><p>Spent the following morning with a few co-workers digging up rarely used networking equipment and proceeded to wire-up the machines. The two 4-port switch cum wireless APs were miserable — they only leave us with 6 usable LAN ports. The other 2 machines had to do with 802.11G wireless. It&#8217;ll work, but just a little slower. I was hoping to complete this whole ordeal before the day is to end, i.e. 5.30 pm, and go home on time. After all, copying 15 GB from the portable harddisk onto one of the laptops already took a grand total of 60 minutes. If I had to do this serially and linearly, it&#8217;ll take no less than 8 hours. Portable harddisks are rare too, especially for filesizes that huge.</p>
</p><p class="whiteline"><p>I configured the DHCPd and got the whole network running nicely and proceeded to install uTorrent on all the machines (skipping the rubbish, ad-supported nonsense). That took hardly 10 minutes as Samba CIFS came into play. It&#8217;ll be cool if there&#8217;s a automatic install distributor but I&#8217;ve not got time for it.</p>
</p><p class="whiteline"><p>Created the initial seeding torrent according to the guide and that process took almost 15 minutes. Thousands of tiny files, coupled with gigantic files, whatever you can imagine, the limits of the filesystem are being tested here.</p>
</p><p class="whiteline"><p>Started the seed on the tracker, turned on &#8216;Initial Seeding&#8217; while I distributed the newly created .torrent to the rest of the machines.</p>
</p><p class="whiteline"><p>Changed back to standard Seeding once all the machines have entered the swarm.</p>
</p><p class="whiteline"><p>Thinking about the 8 hours that I would have to take, going by the conventional advice, I grinned and went on to do other work, while giving my forecast of completion to &#8216;End of the Day&#8217;.</p>
</p><p class="whiteline"><p>The seeding started at around 9 to 9.30 am. I drove out to buy breakfast for everyone and came back at around 10.30 am.</p>
</p><p class="whiteline"><p>I took a peak at the progress and I got a shock of my life.</p>
</p><p class="whiteline"><p>All the wired Ethernet clients are now seeding! 100% download complete! With only the 2 miserable wireless clients left struggling with the slow connection. I exchanged the wire and wireless connection with 2 other computers and I saw the download speed race to the roof.</p>
</p><p class="whiteline"><p>12.2 MB/s. It works out to ~100 Mbps.</p>
</p><p class="whiteline"><p>Every 30 seconds, the download speed will slow a little and a uTorrent would pop a warning at the status bar, &#8220;Harddisk overload 100%&#8221;. Wow, a solid harddisk LED.</p>
</p><p class="whiteline"><p>I&#8217;m impressed.</p>
</p><p class="whiteline"><p>Darned. I thought the transfer would take the whole day, giving me time for a well deserved break, but little did I know, the transfer had completed before I even had lunch!</p>
</p><p class="whiteline"><p>So, now you know. BitTorrent is extremely efficient in one-to-many, many-to-many, and many-to-one distribution tasks. As long as the overhead of installing and running uTorrent on every machine is well distributed and / or paid for, this is an extremely useful piece of software to add into any sysadmin&#8217;s arsenal.</p>
</p><p class="whiteline"><p>Some other hidden benefits of BitTorrent are that it is resumable, repairable, distributed (many to many, any seeder / peer can enter or leave the swarm without much disruption nor require any human rectification), lightweight (300k installer), and automated (once past the initial start, and handles disconnections gracefully).</p>
</p><p class="break"><p>Really, BitTorrent has its legitimate use as above, quod erat demonstrandum (Q.E.D.).</p></p>
