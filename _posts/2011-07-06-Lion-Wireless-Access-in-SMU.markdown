--- 
permalink: /blog/archives/817-Lion-Wireless-Access-in-SMU.html
layout: post
title: Lion Wireless Access in SMU
date: 2011-07-06 11:40:37 +08:00
s9y_link: http://www.iphoting.com/blog/archives/817-Lion-Wireless-Access-in-SMU.html
categories: 
- computers
- school
- apple
- lion
- mac
- osx
- smu
- sysadmin
- wireless
---
<em>Update 1: I&#8217;ve tested the profile and found that it doesn&#8217;t not work due to certificate issues. I&#8217;ve updated v0.2 of the profile and I hope it solves the problem.</em>

<em>Update 2: There have been infrastructural changes, i.e. WLAN-Student is depreciated by WLAN-SMU. Hence, please refer to <a href="http://smumacness.com/news/latest-configuration-guide-is-out/">SMU Macness&#8217;s Configuration Guide for Mac users</a> and ignore the configuration profile on this post. Their instructions supersede that of here.</em>

Singapore Management University (SMU) employs 802.1X authentication for its wireless network access. Mac OS X has always had certain kinks when dealing with multiple 802.1X profiles, such as SMU&#8217;s and Wireless@SGx&#8217;s.

Apple has changed the 802.1X configuration screen for Mac OS X Lion. End-users are no longer able to manually add 802.1X configuration profiles within the Advanced Network Preferences panel. All 802.1X configurations are now managed by a &#8220;configuration profile&#8221;, provided by a systems administrator. I hope this redesign increases the stability and reliability of the 802.1X mechanism in Mac OS X.

Well, you may ask, what is a &#8220;configuration profile&#8221;?

Apparently, it&#8217;s quite simple. They are the same .mobileconfig profiles used for iOS devices and the same Apple iPhone Configuration Utility can generate compatible profiles for Mac OS X Lion.

For your convenience, I&#8217;ve provided an <a href="http://cl.ly/351L0A1F3x1p000h2d2A">untested configuration profile here</a>, that will configure your SSID to WLAN-Student and to use 802.1X, according to the credentials you supply when you install the profile onto your computer.

<img src="http://static-s3.iphoting.com/blog/uploads/School/SMU-WiFi.png" alt="" />

Do look through the contents of the profile before installing and ignore the warnings that the profile is unsigned. I will provide further updates to the profile when I have a chance to conduct some field tests.

I hope this helps the early adopters out there.

Download: <a href="http://cl.ly/2O302f3S2r073D3B2427">Lion Wireless 802.1X Configuration Profile for SMU v0.2</a>.
