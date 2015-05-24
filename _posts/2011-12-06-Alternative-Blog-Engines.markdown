---
permalink: /blog/archives/834-Alternative-Blog-Engines.html
layout: post
title: Alternative Blog Engines
date: 2011-12-06 01:39:00 +08:00
s9y_link: http://www.iphoting.com/blog/archives/834-Alternative-Blog-Engines.html
categories:
- computers
- development
- git
- blogging
---

Recently, I've been hunting around for a blogging engine that can replace this ageing installation of [Serendipity][s9y]. The reason why I went with a full-blown [PHP][] on-the-fly dynamically generated system was that there was no other way to provide interactivity to visitors to a blog. Stuff like commenting, link tracking, and page tracking were all impossible.

However, with the rise of AJAX and JavaScript capabilities in browsers, what was once only possible on the server-side can now be delegated to the client-side. Rather than having the server operator foot the cost of running the whole infrastructure, part of it can be "outsourced" to visitors who are on similarly powerful computers.

When dealing with a handful of visitors, the processing power requirements on the server-side is low and negligible. However, when you scale up to above 150 concurrent visitors, everything starts to crumble and the load becomes asymmetrical. Distributing or outsourcing part of the site generation to visitors can save a site when under heavy loads.

With [Google Analytics][analytics] and [Disqus][], all dynamic parts of a site, once formally under the domain of dynamic server-side scripting, can now be offloaded to visitors with the use of asynchronous JavaScript. How it actually works is that the visitor's browser fetches a static and light-weight HTML from my server, parses it and loads externally linked JavaScript files from these content providers, such as Google and Disqus, and then renders and attaches the output onto the static HTML site.

This way, a once static HTML page has become dynamic, with much of the data outsourced to content providers, and rendering to visitors' browsers.

The upsides of managing static HTML is that it requires very little infrastructure to support and aggressive caching can be employed with the help of CDNs. If a server migration is needed, the static HTML files just need to be mirrored over and all will be well.

So now, the problem shifts to that of generating these static HTML files. Surely they all require a unified look and hence have much markup in common, manually managing this across thousands of files will be a chore. A different kind of blogging engine is thus required. One that takes a set of templates, applies it consistently to all your posts, possibly written and formatted in [markdown][], and outputs to a directory where a web server can serve files from it verbatim.

As part of my hunt, I've found 2 solutions that fit my requirements, one way or the other, with different and contrasting Pros and Cons.

The easiest solution that I've found is [Calepin.co][calepin]. It basically takes a folder of markdown formatted posts and runs it through [Pelican][], a python-based static blog generator, and generates a usable blog at http://*username*.calepin.co.

The upside is that it is easy to use and relies on Dropbox where you can access anywhere, including an iPad, with [iA Writer][iaw]. You blog will be generated when you click a button on the calepin site.

The downside is that there is no custom CNAME (domain) support yet and there is no customisation available for the blog layout. You can't even have a static "About" page on the blog! These two downsides (especially the first) are an absolute deal breaker for me.

The next blogging engine that I've found is [Octopress][]. It is basically a bunch of wrapper scripts and a curation of plugins around [Jekyll][]—a no-frills static blog generator based on Ruby.

It has all the features I need, such as CNAME (via heroku or github pages), static pages, but the downside is that it requires [Ruby][] 1.9.2 to run. Mac OS X Lion and most other distributions come only with 1.8.x version of Ruby and getting the 1.9.x branch requires the installation of [RVM][], which in itself is easy but it makes ugly modifications to your shell environment. Fortunately, I can work-around this downside by generating my site in a virtualised environment with RVM and Ruby 1.9.2 installed.

Given that Calepin is iterating at a rather high velocity, I'm considering holding back for a while before I decide to rule it out completely. On Twitter, the [developer][1] has indicated that CNAME is on his todo list, and he might be considering support for static pages.

Nonetheless, if for whatever reason I have to rule-out Calepin, I will consider adopting its typeface and layout cues into Octopress and write a few wrapper scripts around it to accept input from a Dropbox directory.

It looks to be an exciting time for an epic redesign for my various web-properties.

[1]: http://twitter.com/calepinapp
[ruby]: http://www.ruby-lang.org/
[RVM]: http://beginrescueend.com/
[jekyll]: https://github.com/mojombo/jekyll/wiki
[octopress]: http://octopress.org/
[iaw]: http://www.iawriter.com/
[pelican]: http://pelican.readthedocs.org/
[calepin]: http://calepin.co/
[s9y]: http://www.s9y.org/
[PHP]: http://www.php.net/
[disqus]: http://disqus.com/
[analytics]: http://google.com/analytics/
[markdown]: http://daringfireball.net/projects/markdown/
