---
layout: post
title: "Internship and PaaS"
date: 2012-05-18 01:14
comments: true
categories: [computers, work, internship]
---

14 days ago on a Monday, I began my internship at a local gaming company. I was tasked to explore the various cloud PaaS solutions available to host the company's web-based PHP gaming products. I explored and compared the 4 main options—Heroku, Amazon EC2, PHPFog, and Orchestra.

Of the four, EC2 offers the least abstraction, with the highest amount of programmatic control. Essentially, if EC2 were to be used, we will need to author up a whole suite of site-local management utilities and scripts. That is no different from the current co-located server instances—scaling requires spinning up a whole new instance and initiating a deployment process. We can say that they are the cheapest of the lot. While we won’t use it for hosting our applications, EC2 is still invaluable when you need to muster on-the-fly computing resources.

Orchestra PaaS service alternatively provides a slightly more abstracted service. You get to choose an instance size, similar to the EC2 instance selections, but with the deployment taken care of. They come with a small selection of add-ons, and a reasonable PHP extension set. They offer an elastic solution where the system monitors and automatically scale instances up/down according to live demand. That comes at a cost much higher than EC2 and Heroku.

PHPFog is the most abstracted PaaS service. It deploys your web application to their servers via git and you control the minute details via the web-based control panel. If you require more PHP extensions, or some special configuration, you’re out of luck. Previously, there have been reviews on their service being less than reliable, with one case of a security breach during their public beta period. Their pricing steps are based on instance size and are not infinitely scalable. In short, they feel like a more modern version of the typical shared/dedicated hosting service out in the market—not exactly what we wanted. 

Finally, Heroku. With their newly launched Cedar stack, you can actually roll your own language support. While PHP isn’t a first-class supported language on the Heroku platform, the language-agnostic Cedar stack imposes no restrictions. Just roll your own HTTP stack that runs within the instance and you're set to take advantage of their abstracted scaling and deployment features. At $0.05/hour—slightly more pricy than EC2, but with less administrative overheads—it takes the pain out of infinitely horizontally scaling out any application. Their platform limitations require minor adjustments to the application, but the benefits from these adjustments will be vendor agnostic—you can say that they are stringent "best-practices" for scaling applications.

Given the flexibility and scalability and reasonable cost of the Heroku platform, it looks like an option that we will be exploring in-depth.

In my next post, I'll be writing about rolling your own "custom build pack" that allows you to bring-your-own-language onto the Heroku platform.
