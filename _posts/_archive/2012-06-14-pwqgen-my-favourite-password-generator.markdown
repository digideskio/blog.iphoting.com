---
layout: post
title: "pwqgen—My Favourite Password Generator"
date: 2012-06-14 10:12
comments: true
highlight: true
external-url: https://pwqgen.herokuapp.com/
categories: 
- computers
- security
---

Security best practices encourage different passwords to be used for each site requiring a login. This is because should a particular site suffer a security breach, where all the user passwords are leaked publicly, your password that was leaked is unique to that site. Any malicious person who got hold of your account credentials will not be able to login to your other accounts, like your email.

So, you may ask, how do you track the various passwords used for each site?

There is a two prong solution to this. First, use easy-to-remember, but hard to guess passwords, and second, use a cross-platform password manager.

To generate good but easy-to-use passwords is a challenge. Most password managers include built-in generators but they are awful. These generators have an implied assumption that you'll never have to type them out by copying visually. Hence, these passwords are hard to pronounce and impossible to remember.

I have found one that finally meets my requirements and is now my favourite password generator—pwqgen, from the [passwdqc package][pp].

Here's an example: `Strict!Spin6cairo`.

It is about 17 characters long, pronounceable, easy to type visually, but hard to brute-force. With a different one of these on each of your logins, security breaches will just be a matter of resetting that particular password. Of course, you are to regenerate your passwords every 6–12 months.

There are often times when I needed to generate a password on-the-go, such as at a remote computer or even on my iPad, where I don't have access to `pwqgen`. As such, I've created a [web-interface][web] for it, where it generates a random password on every visit. You might find it useful.

As for a password manager, I use [1Password][1p] which syncs and works across all my Macs, Windows, and iOS devices. iOS support is exceptionally crucial as it allows you to access your passwords on-the-go at a public terminal. While it is not free, it is worth every cent, and its utility is perpetual.

If you want something free, [KeePass][kp] is another alternative, but with a much awful interface.

[kp]: http://keepass.info/
[1p]: https://agilebits.com/onepassword
[web]: https://pwqgen.herokuapp.com/
[pp]: http://www.openwall.com/passwdqc/
