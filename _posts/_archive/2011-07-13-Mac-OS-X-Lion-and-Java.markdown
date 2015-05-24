--- 
permalink: /blog/archives/820-Mac-OS-X-Lion-and-Java.html
layout: post
title: Mac OS X Lion and Java
date: 2011-07-13 01:53:41 +08:00
s9y_link: http://www.iphoting.com/blog/archives/820-Mac-OS-X-Lion-and-Java.html
categories: 
- computers
- java
- lion
- mac
- osx
---
<p>Apparently, Mac OS X Lion no longer bundles the Java runtime by default and is now available as an optional, as needed, download. The Software Update prompt for Java installation will launch when it detects that Java runtime is requested to be executed. Accept and install and you&#8217;ll be able to use it system-wide as usual, or via the command line, i.e. java and javac.</p>

<p>However, there&#8217;s one small tiny snag that Lion users ought to know: The Java web browser plugin is <em>not enabled</em> by default, on Safari or any other browser. If you only use Java for login to secure websites like SingPass, you may run into an error whereby the Java applet is not loaded nor initialised.</p>

<p>To enable the applet in Safari (and hence other browsers), go to the <a onclick="_gaq.push(['_trackPageview', '/extlink/www.java.com/en/download/testjava.jsp']);"  href="http://www.java.com/en/download/testjava.jsp">Java Test Page</a> and observe if the test applet loads. If the Java plugin is indeed disabled, it will show &#8220;Plugin Disabled&#8221; with a clickable arrow next to it. Click on the arrow and a prompt will appear, asking if you would like to enable the Java plugin. Click Enable and reload the page. The applet should now appear and load as usual.</p>

<p>You can now proceed to Java-based login sites such as SingPass and see the error prompt disappear.</p>
