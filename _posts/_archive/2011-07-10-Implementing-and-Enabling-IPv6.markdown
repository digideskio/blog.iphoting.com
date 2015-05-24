--- 
permalink: /blog/archives/819-Implementing-and-Enabling-IPv6.html
layout: post
title: Implementing and Enabling IPv6
date: 2011-07-10 09:18:00 +08:00
highlight: true
s9y_link: http://www.iphoting.com/blog/archives/819-Implementing-and-Enabling-IPv6.html
categories: 
- computers
- ipv6
- sysadmin
- technology
---
<p><em>Update 1: I&#8217;ve added configuration for Ubuntu/Debian derived distributions.</em></p>

<p><a onclick="_gaq.push(['_trackPageview', '/extlink/en.wikipedia.org/wiki/IPv6']);"  href="http://en.wikipedia.org/wiki/IPv6">IPv6</a> is the solution to solving address-space scarcity with IPv4 addressed networks. The next generation solution has been in development since 2001 and has only been seen to be deployed to live-production environments in recent months, no less thanks to <a onclick="_gaq.push(['_trackPageview', '/extlink/www.worldipv6day.org/']);"  href="http://www.worldipv6day.org/">World IPv6 Day</a>.</p>

<p>The biggest trouble with migration to IPv6 is that of compatibility. IPv6 and IPv4 hosts are <em>not</em> mutually intelligible—only IPv6 hosts can communicate with IPv6 servers, IPv4 with IPv4. This is a classic case of interoperability failure and <a onclick="_gaq.push(['_trackPageview', '/extlink/cr.yp.to/djb.html']);"  href="http://cr.yp.to/djb.html">Dr D. J. Bernstein</a> has written about the <a onclick="_gaq.push(['_trackPageview', '/extlink/cr.yp.to/djbdns/ipv6mess.html']);"  href="http://cr.yp.to/djbdns/ipv6mess.html">IPv6 deployment mess</a>. Ideally, IPv6 and IPv4 should be compatible which allows seamless transition and graceful degradation for clients that do not yet support the new IPv6. However, to bridge the gap between IPv6 and IPv4, 3rd party, non-native solutions have to be employed, ranging from tunnelling to translation (4in6, 6to4, 6in4, Teredo, NAT64).</p>

<p>Given this very intrusive and labour-intensive requirement in preparing for the eventual total migration to IPv6, I&#8217;ll attempt to document my experience in setting up IPv6 connectivity for my home network (to other external IPv6 servers/hosts), to make things easier if your network configuration is similar to mine.</p>

<p>Applicable situation:-</p>

<ul>
<li>ISP assigns IPv4 addresses only;</li>
<li>Router supports IPv6 natively (Linksys routers <em>do not</em>);</li>
<li>Client(s) support IPv6 natively.</li>
</ul>

<p>In this post, I shall specifically address configuring a router that is a GNU/Linux machine with sysvinit scripts (and Ubuntu/Debian derived distributions) and radvd (router advertisement daemon—DHCP replacement).</p>

<p>To get IPv6 connectivity when your ISP does not offer direct/native connectivity, one will require a tunnel broker service where all IPv6 packets will be encapsulated in tunnel with IPv4 as the link-layer (don&#8217;t fret too much if you didn&#8217;t catch how it works technically). I recommend Hurricane Electric&#8217;s free <a onclick="_gaq.push(['_trackPageview', '/extlink/tunnelbroker.net/']);"  href="http://tunnelbroker.net/">IPv6 tunnel broker service</a>. Each account allows you to create up to 5 tunnels, more than enough to support a home network (you&#8217;ll only need 1).</p>

<p>To begin, create an account on the tunnel broker site and login. Once done, select &#8220;<a onclick="_gaq.push(['_trackPageview', '/extlink/tunnelbroker.net/new_tunnel.php']);"  href="http://tunnelbroker.net/new_tunnel.php">Create Regular Tunnel</a>&#8221; option. Fill-in the form, specifying your IPv4 address (issued by your ISP—Don&#8217;t worry, this address can be updated dynamically when it changes). Then, verify that a tunnel server that is geographically closest to you has been pre-selected. Finally, click on the &#8220;Create Tunnel&#8221; button.</p>

<p>On the following page (tunnel details), you will be assigned a tunnel server IPv4 address, a tunnel server IPv6 gateway address, your tunnel client IPv6 address, and a routed IPv6 prefix for your personal use on your network (ISPs in future assign IPv6 address by prefixes, which gives each subscriber ). Take note of these 4 different addresses as you will need them to configure the tunnel later.</p>

<p>For the rest of the document, I&#8217;m going to focus on Mandriva Linux (or Ubuntu) as the router. Feel free to follow or adapt accordingly if your machine uses SYSVINIT scripts (or ifupdown). Otherwise, look under the &#8220;Example Configurations&#8221; tab for copy-paste solutions to other OS (especially for Airport Extreme/Time Capsule users).</p>

<p>Set-up the tunnel by creating the file with the following in /etc/sysconfig/network-scripts/ifcfg-sit1 (Ubuntu/Debian, see below):</p>

<pre><code>    DEVICE=sit1
    BOOTPROTO=none
    ONBOOT=yes
    IPV6INIT=yes
    IPV6TUNNELIPV4=&lt;IPv4 of tunnel server&gt;
    IPV6ADDR=&lt;IPv6 of tunnel client&gt;
    GATEWAY=&lt;IPv6 of tunnel server gateway&gt;
</code></pre>

<p>Replacing the last three lines with appropriate substitutions.</p>

<p>Ubuntu users, edit and add the following lines into /etc/network/interfaces:</p>

<pre><code>    auto he-ipv6
    iface he-ipv6 inet6 v4tunnel
        endpoint &lt;IPv4 of tunnel server&gt;
        address &lt;IPv6 of tunnel client&gt;
        netmask 64
        gateway &lt;IPv6 of tunnel server gateway&gt;
        up ip -6 route add default dev he-ipv6
        down ip -6 route del default dev he-ipv6
        post-up echo 1 &gt; /proc/sys/net/ipv6/conf/all/forwarding
</code></pre>

<p>Create a default IPv6 route through the tunnel with the following in /etc/sysconfig/network-scripts/route6-sit1 (not necessary on Ubuntu/Debian):</p>

<pre><code>    ::/0 via &lt;IPv6 of tunnel server gateway&gt; dev sit1
</code></pre>

<p>Substituting with your assigned addresses as necessary.</p>

<p>Enable IPv6 globally by adding the following to /etc/sysconfig/network (not necessary on Ubuntu/Debian):</p>

<pre><code>    IPV6_DEFAULTDEV=sit1
    NETWORKING_IPV6=yes
    IPV6FORWARDING=yes
</code></pre>

<p>Bring up the tunnel with one of the following commands:</p>

<pre><code>    # ifup sit1     # for SYSVINIT only
    # ifup he-ipv6  # for Debian/Ubuntu only
</code></pre>

<p>Now, try testing IPv6 connectivity with IPv6 enabled network diagnostic tools.</p>

<pre><code>    $ ping6 2404:6800:800b::63
    $ ping6 ipv6.google.com
    $ traceroute6 ipv6.google.com
</code></pre>

<p>You should see valid responses from the commands above. If not, re-check your configuration and try again.</p>

<p>Once you&#8217;ve got IPv6 outbound connectivity working, you&#8217;ll need to advertise this prefix to the rest of your clients within your network. The radvd will do exactly this for you, but it requires some configuration.</p>

<p>Assuming the internal-facing interface is eth0 and the &#8220;Routed IPv6 Prefix&#8221; is 2001:470:1:1::/64, in /etc/radvd.conf:</p>

<pre><code>    interface eth0
    {
        AdvSendAdvert on;
        AdvHomeAgentFlag off;
        MinRtrAdvInterval 30;
        MaxRtrAdvInterval 100;

        prefix 2001:470:1:1::/64
        {
            AdvOnLink on;
            AdvAutonomous on;
            AdvRouterAddr on;
        };
    };
</code></pre>

<p>Restart radvd to have the entries take effect.</p>

<p>Now, your clients within your network will automagically be configured with an IPv6 address with your assigned routed prefix. Amazing isn&#8217;t it? Visit <a onclick="_gaq.push(['_trackPageview', '/extlink/www.kame.net/']);"  href="http://www.kame.net/">http://www.kame.net/</a> to see the dancing turtle. You may also want to check out the IPv6 connectivity test at <a onclick="_gaq.push(['_trackPageview', '/extlink/test-ipv6.com/']);"  href="http://test-ipv6.com/">http://test-ipv6.com/</a>.</p>

<p>If you intend to have your router accessible by a public IPv6 address, assign an IPv6 address from your prefix to your external interface.</p>

<p>Assuming your external interface is eth1 (and that your routed IPv6 prefix is 2001:470:1:1::/64), add the following lines to /etc/sysconfig/network-scripts/ifcfg-eth1 (Ubuntu/Debian see below):</p>

<pre><code>    IPV6ADDR=2001:470:1:1::1
</code></pre>

<p>You can assign any number (after the ::) to your network interface, but I chose 1 in this example.</p>

<p>On Ubuntu/Debian, edit and add to /etc/network/interfaces:</p>

<pre><code>    iface eth0 inet6 static
    address 2001:470:1:1::1
    netmask 64
</code></pre>

<p>Reload the interface by doing the following (applies to both Ubuntu and SYSVINIT):</p>

<pre><code>    # ifdown eth1; ifup eth1
</code></pre>

<p>Your router will now be accessible externally via IPv6.</p>

<p>If you have your own domain name, you may want to add the IPv6 address as an &#8216;AAAA&#8217; record.</p>

<p>This concludes my brief walkthrough/HOWTO on enabling IPv6 connectivity through an IPv4-only ISP. Feel free to email me or comment below for clarifications.</p>
