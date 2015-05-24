---
layout: post
title: "Custom 404 Error Pages with Sinatra.rb"
date: 2012-04-22 00:57
highlight: true
comments: true
categories: [ruby, sinatra, blog, octopress, http, development, computers]
---
In the process of porting my blog to Octopress/Jekyll, I wanted to implement a custom 404 error page. Blogs around the internet suggested that I drop a 404.html into my source directory.

Here's what I use:
{% render_code 404.html %}

However, I noticed another problem. Sinatra was not returning HTTP status error 404 for this. A regular status 200 (OK) was sent, leading Google to start indexing these error pages.

But first, let me show you the default `config.ru` Rack-adaptor that ships with Octopress:
{% gist 2438514 config.orig.ru %}

To ensure that the 404.html is served with a status 404, I had to add a `:status` option to `send_file`. Here's how my file now looks like:
{% gist 2438514 config.ru %}
I've rewritten the `not_found` method and also added another condition `!File.directory?(file_path)` within the `send_sinatra_file` method. This is to teach some web servers to serve the `index.html` when the path is a directory.

However, that's not quite it. Support for sending status codes within `send_file` was only recently added and is only available in version 1.4.0 of Sinatra.

Not to worry, we will make use of trusty Bundler to help us fetch the latest version of Sinatra from source. Update the following in your `Gemfile`:

	gem 'sinatra', "~> 1.4.0"

While at it, the gems defined in the Gemfile are ancient. I've cleaned up my Gemfile and here's how it looks like:
{% gist 2438514 Gemfile %}

Once you have updated the Gemfile, run the following commands:

	bundle update
	bundle install

With that, Octopress (and its Rack-compatible web server) will now serve the custom error 404 file not found page with the correct HTTP status code.
