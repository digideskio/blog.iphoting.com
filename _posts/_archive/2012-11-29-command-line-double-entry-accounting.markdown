---
layout: post
title: "Command Line Double Entry Accounting"
date: 2012-11-29 00:13
highlight: false
external-url: false
comments: true
categories: 
- finance
- software
- computers
- accounting
---

As an accountant by training, I have always found that off-the-shelf software available in the market is somewhat lacking and inadequate for my personal accounting needs.

Software like Quicken or Microsoft Money are primarily single-entry systems. While single-entry systems are generally easier to understand, they are somewhat less robust and captures slightly less information compared to a double-entry system. In a double-entry system, each entry records the *flow* of monetary unit (in addition to the change in balances of 2 corresponding accounts), while in a single-entry system, each entry records the *change* in monetary value for that particular account.

To put this into perspective, in a single-entry system, you will probably see the following entry keyed into your cash account when you buy a plate of food for $5:

```
Date: 2012/11/28
Payee: Food Stall
Amount: $5
Account: Asset:Cash
Category: Expenses:Food
```

In a double-entry system, you will see the following instead:
```
Date: 2012/11/28
Payee: Food Stall
Amount: $5
Debit Account: Asset:Cash
Credit Account: Expenses:Food
```

Well, you can see that in the former case, the *category* is (ab)used to double-up as a "credit account" in order to recognise the flow of the $5. The major difference is that the use of categories is optional. In a double-entry system, the credit account must *balance* the debit account, providing an internal consistency check. Should you need to deal with even more complicated transactions, the double-entry system will have no trouble acting as a second pair of eyes.

While admittedly, the double-entry system cannot catch all errors, it will certainly make the generation of reports from the ledger accounts more accurate—monetary values will not just vanish into the abyss of somewhere unaccounted for.

Recently, I came across [Ledger][1], which is a powerful, double-entry accounting system that is accessed from the UNIX command-line.

What makes Ledger stand out from other pieces of software, apart from the fact that it is double-entry, is that it uses a simple, plaintext format. No clunky software interface to deal with—just a text editor will suffice.

A sample entry looks like this (taken from their site):

```
2006/10/15 Exxon
    Expenses:Auto:Gas         $10.00
    Liabilities:MasterCard   $-10.00
```

From a simple plaintext running journal entries file, a multitude of information can be collated and reported. Nothing to configure, nothing to tinker. The balance of the various accounts can be easily inspected:

```
$ ledger balance
              $10.00  Expenses:Auto:Gas
             $-10.00  Liabilities:MasterCard
--------------------
                   0
```

It's a geeky accountant's dream come true.

Alternatively, if you like clicking on user interfaces (albeit ugly ones), there's [GnuCash][2]. Unfortunately, it uses a less simple file format.

[1]: http://www.ledger-cli.org/
[2]: http://www.gnucash.org/