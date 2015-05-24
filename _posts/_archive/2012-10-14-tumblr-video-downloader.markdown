---
layout: post
title: "Tumblr Video Downloader"
date: 2012-10-14 00:34
highlight: true
comments: true
categories: 
- computers
---

There were multiple occasions that I needed to download a video clip hosted on Tumblr and got lazy digging through the page-source for the file location.

So, to solve this trouble once-and-for-all, I whipped up a simple bash script that takes a single URL argument and it'll download the video clip into the current directory.

It's really simple and dirty and I hope you might find it useful.

{% gist 3877286 tumblr_video_downloader.sh %}

It requires a recent version of [curl][].

**Update**: By popular demand, here's a [web-based version][1].

[1]: https://tumdlr.herokuapp.com/
[curl]: http://en.wikipedia.org/wiki/CURL