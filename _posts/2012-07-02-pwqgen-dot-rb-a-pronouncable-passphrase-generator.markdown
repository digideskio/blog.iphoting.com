---
layout: post
title: "pwqgen.rb—A Pronouncable Passphrase Generator"
date: 2012-07-02 00:26
highlight: true
comments: true
categories: [computers, ruby, password, security]
---
The fantastic pwqgen from the [passwdqc][1] package is a one-of-a-kind implementation of a pronounceable random passphrase / password generator. I've been searched around the net for something similar but there were none.

The passphrase generator that I want needs to be pronounceable, easy to read and type, and most importantly still secure. Of course, passwords are the most secure with a random string of characters, but they are hardly useable. More readable ones need to be longer but given their readability, the slight increase in length is a well-worth tradeoff. [xkcd: Password Strength](http://xkcd.com/936/) illustrates this concept succinctly.

So here it is, announcing pwqgen.rb: a Ruby implementation of passwdqc's pwqgen, a random pronouncable password generator. Available on [[RubyGems][rg]] and [[Source](https://github.com/iphoting/pwqgen.rb)].

It comes as a Ruby module/class and an accompanying command line tool.
<!-- more -->
## Requirements
- Ruby >= 1.9.2

## Installation
```
gem install pwqgen.rb
```

## Usage
### CLI
You can generate a random password from the command line.
```
$ pwqgen.rb --help
Usage: pwqgen.rb [options] [<length>]

Options:
  -h, --help      show this help message and exit
  -v, --version   show version and exit

<length>: Number of words in the passphrase. [default: 3]
```

### Ruby App
You can `require` it within your app:
```
require 'rubygems'
require 'pwqgen'

p Pwqgen.generate             # => "Image&Both-action"
p Pwqgen.generate 5           # => "Alaska_Union9Calf=domain&ever"

pgen = Pwqgen.new             # => #<Pwqgen::Generator:0x9f6ec40 ...>
p pgen.generate               # => "String5Rebel+horse"
p pgen.generate 2             # => "Easily2desist"
```

## Related

- A web-based demonstration is available on [Heroku](https://pwqgen.herokuapp.com/). ([Source](https://github.com/iphoting/pwqgen-web)).
- Original C Implementation, <http://www.openwall.com/passwdqc/>.

## Credits

- Original Design and C implementation from <http://www.openwall.com/passwdqc/> by Solar Designer.

## Known Issues
The random number generator is based on MT algorithm. I welcome pull-requests for better implementations of a random number generator.

[1]: http://www.openwall.com/passwdqc/
[rg]: https://rubygems.org/gems/pwqgen.rb/
