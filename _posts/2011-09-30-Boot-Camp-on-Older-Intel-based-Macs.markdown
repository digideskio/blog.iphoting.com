--- 
permalink: /blog/archives/830-Boot-Camp-on-Older-Intel-based-Macs.html
layout: post
title: Boot Camp on Older Intel-based Macs
date: 2011-09-30 17:43:24 +08:00
highlight: true
s9y_link: http://www.iphoting.com/blog/archives/830-Boot-Camp-on-Older-Intel-based-Macs.html
categories: 
- computers
---
<p>While installing Windows 7 (x64) on a white (late-2007) Macbook via Boot Camp 4.0 (Lion), I received the following error when running the setup.exe from the disc downloaded and created by Boot Camp Assistant:</p>

<blockquote>
  <p>Boot Camp x64 is unsupported on this computer model.</p>
</blockquote>

<p><em>(But first before continuing, please ensure that Windows 7 64-bit edition is actually supported on your Mac before manually bypassing this error.)</em></p>

<p>After digging around on the net, I&#8217;ve found that this computer model check can be bypassed by running &#8220;Bootcamp64.msi&#8221; directly from the &#8220;Drivers/Apple/&#8221; folder, found in the Boot Camp support disk or drive.</p>

<p>However, another annoying error may popup:</p>

<blockquote>
  <p>This installation requires elevated privileges. Launch the installer through setup.exe</p>
</blockquote>

<p>Back to square one. The option to run the .msi as a system administrator is blanked out within file properties. With right-click non-functional, there&#8217;s not much more prodding I could do.</p>

<p>After further digging all over the internet, I&#8217;ve found that the solution is to launch Bootcamp64.msi via msiexec through a cmd.exe that has elevated permissions.</p>

<p>Here&#8217;s how to go around doing it without right-clicking at all:</p>

<ol>
<li>Open the Start Menu.</li>
<li>Type &#8220;cmd&#8221; into the search box.</li>
<li>Cmd.exe should appear as the first result under &#8220;Programs&#8221;.</li>
<li>Instead of hitting <em>Enter</em> to open it, hit <em>Ctrl + Shift + Enter</em> (⌃⇧↩) instead.</li>
<li>Accept the UAC dialog and command line will now run.</li>
<li>Assuming that the disc of your Boot Camp support drivers is &#8220;D:&#8221;, enter the following in to the prompt:</li>
</ol>

<blockquote>
  <p>D:</p>
  
  <p>cd Drivers\Apple</p>
  
  <p>msiexec /i Bootcamp64.msi</p>
</blockquote>

<p>The Boot Camp (x64) installer should now start normally.</p>

<p>As there I have yet to know any technical pitfalls of bypassing Apple&#8217;s check in the setup.exe so far, I suspect the reason is more legal and technical-support related than just purely technical.</p>

<p>Have fun!</p>
