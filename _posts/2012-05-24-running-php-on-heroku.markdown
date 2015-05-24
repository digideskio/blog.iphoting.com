---
layout: post
title: "Running PHP on Heroku with a Custom Build Pack"
date: 2012-05-24 23:24
highlight: true
comments: true
categories: 
- heroku
- web
- PHP
- development
---

Currently, Heroku supports running custom 3rd party languages on their Cedar stack through the use of custom "build packs". [Build packs][bp] are git repos that contain instructions for the Heroku "slug compiler", which tell the slug compiler how to deploy the HTTP stack. This way, with a custom build pack, one can instruct the slug compiler to download and deploy a custom build of Nginx+PHP-FPM stack with any number of PHP extensions, if so desired.

To this end, as part of my internship, I've created a custom build pack for the Heroku Cedar stack that incorporates Nginx, PHP–FPM, with APC, memcache, memcached, phpredis, and newrelic modules. You can find the repo [here][repo].

To use, fork, make your own changes, and read the included README file.

[repo]: http://GitHub.com/iphoting/heroku-buildpack-php-Tyler/
[bp]: https://devcenter.heroku.com/articles/buildpacks
<!-- more -->

## Anatomy of a Build Pack

In all Heroku build packs, there is a `bin/` directory containing `compile`, `detect`, and `release` bash scripts. These scripts are executed at different stages of slug compilation.

The `detect` script is run whenever a push is received to check that the app that is pushed is compatible with the current build pack. For PHP apps, the `detect` script checks for the presence of an `index.php`. 

Following which, the `compile` script executes. It generally fetches Nginx, PHP–FPM, and any other required libraries. Then, a `boot.sh` script is generated for later use, which contains instructions on how to start the various executables in the deployed HTTP stack.

Finally, the `release` script, which sets up the app variables in YAML format, is loaded, but only for the initial deploy. Should you want to modify any variable subsequently, use the `heroku config` command instead.

For more details on the slug compilation process, refer to Heroku's [Buildpack Reference][bpr] page.

[bpr]: https://devcenter.heroku.com/articles/buildpack-reference

## Customising a Build Pack

The Heroku slug compiler has a hard coded list of official build packs—the starting point for all customisations. Pick the one that is architecturally the most similar to what you want to build and fork it on GitHub.

I forked this build pack to add other important PHP extensions and to switch to a Nginx web server to reduce memory usage. After all, each web dyno has only 512 MB of memory and the key to reducing costs is to squeeze as many PHP workers as possible into a dyno.

## Packaging Build Pack Binaries for Use

After customising a build pack, you must precompile the binaries before they can be deployed onto the stack during the slug compilation phrase. To do so, refer to the `README` file and the relevant scripts under the `support` directory. Refer to Heroku's [Packaging Binary Buildpack Dependencies][bpd] page for more details.

Generally, it involves using the Heroku environment to compile the binaries into a tar.gz, uploaded to a S3 bucket, and then later fetched and deployed during the slug compilation phrase. The [vulcan gem][vulcan] is used for this. Refer to `support/package_nginx` for the details on how to use the Vulcan command.

However, as the PHP compilation is not as straightforward as Nginx, spinning up an AWS EC2 instance (ami-04c9306d) within ` us-east-1` AZ is required. Refer to the `support/ec2-up.sh` script for hints on how to programmatically bring up an instance. The `support/ec2-build-php.sh` script is to be run on the EC2 instance to automate the compilation routine. Finally, remember to upload the artefacts onto S3 before shutting down the EC2 instance as all data will be lost.

Finally, update the `bin/compile` to ensure that the S3 bucket and version numbers are specified correctly.

That's it! This is how a custom build pack is created and made ready for use. Go forth and run awesome things on the Heroku platform!

[vulcan]: https://github.com/heroku/vulcan
[bpd]: https://devcenter.heroku.com/articles/buildpack-binaries
