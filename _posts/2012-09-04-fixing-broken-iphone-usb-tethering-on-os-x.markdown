---
layout: post
title: "Fixing Broken iPhone USB Tethering on OS X"
date: 2012-09-04 10:17
highlight: true
comments: true
categories: 
- iPhone
- OSX
- computers
---

Somewhere either between upgrading OS X from 10.7 (Lion) to 10.8 (Mountain Lion), or installing the [iPhone Configuration Utility][1], you might have noticed that your iPhone USB tethering has stopped working (Wifi and Bluetooth methods still work). Similarly, you might also have had the iPhone USB entry within Networking Preferences deleted and never been able to have it back.

<!-- more -->
(**Warning**: This method does not seem to work for Snow Leopard and older. See comments section for details.)

Apparently, the issue is rather straightforward. According to [David Empson on the apple discussion forums][2], the `AppleUSBEthernetHost.kext` kernel extension installed by the iPhone Configuration Utility is broken.

To find out if it is indeed broken on your computer, open Terminal.app and try the following:

```
$ file /System/Library/Extensions/AppleUSBEthernetHost.kext/Contents/MacOS/AppleUSBEthernetHost
```

You should see the following output (if all is well):

```
/System/Library/Extensions/AppleUSBEthernetHost.kext/Contents/MacOS/AppleUSBEthernetHost: Mach-O universal binary with 3 architectures
/System/Library/Extensions/AppleUSBEthernetHost.kext/Contents/MacOS/AppleUSBEthernetHost (for architecture i386):	Mach-O object i386
/System/Library/Extensions/AppleUSBEthernetHost.kext/Contents/MacOS/AppleUSBEthernetHost (for architecture ppc):	Mach-O object ppc
/System/Library/Extensions/AppleUSBEthernetHost.kext/Contents/MacOS/AppleUSBEthernetHost (for architecture x86_64):	Mach-O 64-bit kext bundle x86_64
```

If you *do not* see at least the line with `x86_64`, continue to the solution below. Otherwise, this is not the problem, neither is the solution below appropriate for you.

To fix the faulty `AppleUSBEthernetHost.kext`, it needs to be reinstalled from the iTunes package. Follow the steps below:

0. Unplug your iPhone from the computer.
1. Download the [iTunes installer][3].
2. Remove the old kernel extension:

		$ sudo rm -Rf /System/Library/Extensions/AppleUSBEthernetHost.kext

3. Run the iTunes installer and let it finish.
4. Load the updated kernel extension:

		$ sudo kextload /System/Library/Extensions/AppleUSBEthernetHost.kext

Now, turn on USB tethering on your iPhone and plug it into your Mac. A new network interface prompt should now appear.

Click on the `Network Preferences` button and you should see `iPhone USB`. Then, click the `Apply` button and you should see the `iPhone USB` interface become connected.

That's it, iPhone USB tethering should now work as before.

[1]: http://support.apple.com/kb/DL1465
[2]: https://discussions.apple.com/message/17875670#17875670
[3]: http://www.apple.com/itunes/download/
