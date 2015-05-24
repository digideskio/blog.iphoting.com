--- 
permalink: /blog/archives/825-Java-7-on-Mac-OS-X-Lion.html
layout: post
title: Java 7 on Mac OS X Lion
date: 2011-08-30 19:23:13 +08:00
s9y_link: http://www.iphoting.com/blog/archives/825-Java-7-on-Mac-OS-X-Lion.html
categories: 
- computers
- apple
- is200
- java
- jdk7
- lion
- mac
- osx
- school
- smu
---
<p>Believe it or not, the Java framework installed in Lion is still stuck in the past at version 6. JDK 7 has already been released by Oracle a few months back, but Apple has now transferred the responsibility of maintaining the Mac OS X port back to Oracle.</p>

<p>The OpenJDK project is now in the process of porting and implementing OS X specific code from Apple into the Java mainline codebase. The current status of the port can be seen in the <a onclick="_gaq.push(['_trackPageview', '/extlink/wikis.sun.com/display/OpenJDK/Mac+OS+X+Port+Project+Status']);"  href="http://wikis.sun.com/display/OpenJDK/Mac+OS+X+Port+Project+Status">Mac OS X Port Project Status page</a>. Current outstanding or incomplete features are specific to the Mac platform, like printing and locale support. If you don&#8217;t need such tight integration with the OS, you can actually start using JDK 7 for development.</p>

<p>For my IS200 course on Java programming (IS Software Foundations), there is a specific JDK 7 requirement for some pre-built class files distributed in the course materials. The Java 6 compiler within Lion refuses to compile and link such classes, claiming major version number incompatibility. This leaves me with no choice but to get JDK 7 up and running, or boot into Windows via Parallels (YUCK!).</p>

<p>Fortunately, there is a unofficial pre-release build of JDK 7 for Mac OS X which can be downloaded <a onclick="_gaq.push(['_trackPageview', '/extlink/code.google.com/p/openjdk-osx-build/downloads/list?q=label:Featured']);"  href="http://code.google.com/p/openjdk-osx-build/downloads/list?q=label:Featured">here</a>. <a onclick="_gaq.push(['_trackPageview', '/extlink/wikis.sun.com/display/OpenJDK/Mac+OS+X+Port']);"  href="http://wikis.sun.com/display/OpenJDK/Mac+OS+X+Port">Specific instructions</a> are available.</p>

<p>In short, it is a 4 step process to get JDK 7 running with the command line.</p>

<ol>
<li>Download an <a onclick="_gaq.push(['_trackPageview', '/extlink/code.google.com/p/openjdk-osx-build/downloads/list?q=label:Featured']);"  href="http://code.google.com/p/openjdk-osx-build/downloads/list?q=label:Featured">unofficial build</a>.</li>
<li>Open /Applications/Utilities/Java Preferences.app.</li>
<li>Drag both &#8220;OpenJDK 7&#8221; entries to the top of the list.</li>
<li>Test java by running &#8220;java -version&#8221; in /Applications/Utilities/Terminal.app.</li>
</ol>

<p>There is a new unofficial build every few days with <a onclick="_gaq.push(['_trackPageview', '/extlink/code.google.com/p/openjdk-osx-build/wiki/Changelog']);"  href="http://code.google.com/p/openjdk-osx-build/wiki/Changelog">new bug fixes</a>, so bookmark the google code download page and update frequently.</p>

<p>With this port, it is almost 100% possible to finish the IS200 course with just Mac OS X. With the exception that the exams are conducted on Windows machines with the awful cmd.exe and NotePad++.</p>
