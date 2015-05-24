---
layout: post
title: "IPv6 on Amazon AWS EC2"
date: 2012-06-02 15:44
highlight: true
comments: true
categories: [ec2, amazon, aws, ipv6, computers]
---

*If you're looking for instructions for non-Amazon EC2 instances, i.e. Xen, VPS, or physical servers, refer to my [previous post][1] instead.*

Ok here goes. Amazon doesn't seem to have any plans to implement IPv6 internally for their EC2 instances. Their recommended workaround is to use their Elastic Load Balancer which offers a dual-stack address. However, there are limitations to what a load balancer can do as it cannot forward every type of traffic.

So, to bring IPv6 connectivity to an EC2 instance, tunnelling must be used. Personally, I find Hurricane Electric's [Tunnel Broker][tb] service perfect for this situation.

In this post, I'll discuss the steps on how to set up HE's Tunnel Broker service on your Ubuntu EC2 instance and to keep it up and running.

<!-- more -->

## Prerequisites
First things first, a few prerequisites:

1. [Sign up][signup] for an account with HE's Tunnel Broker website, or [login][tb1] if you already have one.

2. Ensure that your EC2 instance has a permanent [Elastic IP][eip]. Otherwise, every time your instance is re-started, a new public address is randomly assigned by AWS.

	(The tunnel broker needs a relatively stable IP address to your EC2 instance, unless you want to run a dynamic DNS updating client on your EC2 instance.)

3. In your EC2 security group, ensure that inbound ICMP protocol is allowed.

[eip]: http://aws.amazon.com/articles/1346

## Creating a New IPv6 Tunnel

1. Create a new IPv6 tunnel by choosing the "[Create Regular Tunnel][new]" link on the left.

2. Enter your EC2 public Elastic IP into the IPv4 Endpoint box and select a tunnel server nearest to your AWS region.

3. The tunnel should now be created. Go to the main page and select it from the list.

4. Take note of the following: `Client IPv6 Address`, `Server IPv4 Address`, and `Routed /64` prefix.

## Setting Up the IPv6 Tunnel

Add the following snippet to the network interfaces file, `/etc/network/interfaces` to configure your tunnel *(updated to use `curl` instead; see credits section for more details)*:

```
auto he-ipv6
iface he-ipv6 inet6 v4tunnel
	address $CLIENT_IPV6
	netmask 64
	endpoint $SERVER_IPV4
	local `/usr/bin/curl http://169.254.169.254/latest/meta-data/local-ipv4`
	up ip -6 route add default dev he-ipv6
	down ip -6 route del default dev he-ipv6
```

Replace the `$CLIENT_IPV6` and `$SERVER_IPV4` placeholders with the actual values.

Bring the tunnel up:
```
ifup he-ipv6
```

Finally, find an IPv6 address of your choice from your assigned `Routed /64` prefix. Say your prefix is `2001:470:abcd:c70::`, you can use the first address as your IPv6 address for your `eth0` interface by adding a 1 to the prefix: `2001:470:abcd:c70::1`.

Statically assign this IPv6 address to `eth0`. Add the following lines such that the `eth0` section looks like this:

```
# The primary network interface
auto eth0
iface eth0 inet dhcp
iface eth0 inet6 static
	address $IPV6_ADDR
	netmask 64
```

Replace `$IPV6_ADDR` placeholder with the IPv6 address you've picked.

The changes will only take effect after a restart. For immediate effect, use the following command (replace the `$IPV6_ADDR` placeholder) :

```
ip -f inet6 addr add $IPV6_ADDR dev eth0
```

## Keeping the Tunnel Up
As AWS EC2 employs a NAT system for its instances, the connection to the tunnel broker server must be kept open by having the EC2 instance ping the tunnel broker server regularly.

Add the following lines into `/etc/cron.d/he-ipv6`, replacing the `$SERVER_IPV6` placeholder:

```
*/2 * * * *     nobody  ping6 -c3 -n -q $SERVER_IPV6 > /dev/null
```

This tells cron to `ping6` `$SERVER_IPV6` every 2 minutes with 3 packets.

As long as data travels through the tunnel, it will stay open, allowing your EC2 instance access to the outside world.

## Final Notes
As this is a tunnel for IPv6 traffic, as a security precaution, I recommend installing and setting up a firewall, at least for IPv6 traffic.

Personally, I use [Shorewall][].

### Credits
The instructions are adapted and inspired from the following sources:

- <https://forums.aws.amazon.com/thread.jspa?messageID=292023>
- <https://www.datacentrix.org/blog/faq/IPv6-tunnel-+-rDNS-on-Amazon-EC2-running-Ubuntu.html>
- **Updated**: Removed the section on creating a `/usr/local/bin/checkipeth0` script. A simpler solution with `curl` can be used instead. Thanks to Kirill Miazine for pointing this out.

[shorewall]: http://shorewall.net/
[1]: {% post_url 2011-07-10-Implementing-and-Enabling-IPv6 %} "Implementing and Enabling IPv6"
[tb]: http://tunnelbroker.net/ "Hurricane Electric Tunnel Broker"
[tb1]: http://tunnelbroker.net/ "Login to Tunnel Broker"
[signup]: http://tunnelbroker.net/register.php "Register for an Account"
[new]: http://tunnelbroker.net/new_tunnel.php
