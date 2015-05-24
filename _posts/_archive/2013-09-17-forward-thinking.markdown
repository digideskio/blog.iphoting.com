---
layout: post
title: "Forward-Thinking"
date: 2013-09-17 17:38
highlight: false
external-url: false
comments: true
categories: 
- apple
- computers
- technology
---

On September 10, 2013, Apple unveiled the [iPhone 5c][5c] and [iPhone 5s][5s] to the public. The 5c is essentially a previous-generation iPhone 5 with a new plastic enclosure, bigger battery, and an HD front-facing FaceTime camera. Nothing too fascinating on the technological side of things, but from the economics and business perspective, Ben Thompson has written a [great piece][1].

The iPhone 5s deserves further scrutiny. There were only 3 major features announced: First, a 64-bit capable [Apple-designed A7][A7] chip, that employs the ARMv8 architecture. As a sub-point, the [Apple M7][M7] motion co-processor was introduced as a low-power chip, designed to "collect sensor data from integrated accelerometers, gyroscopes and compasses and off load the collecting and processing of sensor data" from A7 chip in the iPhone 5s. Second, an amazingly powerful camera system, with hardware and software innovations. Third, [Touch ID][TID], a fingerprint sensor that authenticates the user, just by touching the home-button.

All three features revealed have *huge* implications. However, I have time only to write on one idea, and briefly touch on the rest.

## Camera
The best camera is the one you have with you. Instagram has consistently showed us that iPhones take the best photos, and with these hardware and software improvements, it is unlikely that other devices can take its place.

## Touch ID
Finally bringing their acquired AuthenTec technology into their products, we get an excellent fingerprint reader integrated into the home-button. One that does not require sliding, works in any direction, recognises only live fingers, and does it fast. I wouldn't be surprised that the efficiency and speed of A7 plays a huge part to make this happen, seamlessly.

That said, the software implementation is rather impressive. Touch ID will refuse to unlock restarted phones, or phones that have not been unlocked within the last 48 hours—a manual passcode input is required for these cases. Clearly, somebody has thought about the weakness of the technology before bringing it to the mass-market.

A secret enclave within the new A7 chip was highlighted as a storage area for fingerprint data. Brian Roemmele wrote a [great piece][se] on the significance of this secret enclave. Essentially, Brian suggests that 7 years of secret innovation ended up in that secret enclave, opening up the world to new applications and possibilities, including but not limited to mobile transactions. As A7 chip and its successors become more mainstream, exciting possibilities await us.

[se]: http://qr.ae/NK5Lp

## M7

While a new 64-bit processor with twice the transistors is nothing to belittle, it is however, not the most significant. Tucked away with little fanfare is the M7 co-processor. Marketing says that it continuously tracks data from sensors without having to wake the CPU up, saving battery.

No doubt, the sharp ones will notice that this engineering effort for a new chip cannot be just for saving battery on the iPhone 5s; there has got to be a more significant and wide-spread use, which the iPhone 5s is merely a test-bed for.

Imagine for a moment. Marketing says that the phone will be able to tell if one is walking, driving, or sitting. What if the M7 is on a different device, one that is always with you, one that has even more sensors? Would this be the foundation of Apple's wearable-computing solution?

## RUIs

Last October, I wrote about [Revolutionary User Interfaces][rui]  and suggested that Siri is the forth RUI. Guess what, in iOS 7, Siri has left its beta status and it seems Apple is confident in Siri's comprehension abilities, even as it continues to self-improve. Siri eyes-free has also now been rebranded as "[iOS in the Car][car]".

At the end of the post, I suggested that Passbook—where location-based events meet contact-less commerce, might be the fifth RUI. I think I need to update that statement given new revelations.

While Touch ID wouldn't qualify as a user interface alone as it is an authentication enabler, but together with the M7 chip and its sensors, the combination might just fit the bill as the fifth RUI. Passbook is just the graphical interface and I believe it will evolve into something even more powerful and encompassing.

Location-based events can be triggered by motion sensors, including low-power bluetooth iBeacons, tracked by the M7, and authenticated with Touch ID, unlocking secret identity credentials stored with the CPU's secure enclave, enabling contact-less commerce.

While most of the hardware pieces are only just coming together,  when it is full envisioned, we can expect major disruption to current transaction networks; we can formally bid farewell to NFC.

It sounds super far-fetched and illegal but Apple could just theoretically become the biggest Bitcoin exchange overnight.

Just think about that for a moment.

[car]: http://en.wikipedia.org/wiki/IOS_in_the_Car
[rui]: /blog/2012/10/16/revolutionary-user-interfaces/
[1]: http://stratechery.com/2013/thinking-about-iphone-pricing/
[5c]: http://www.theverge.com/products/iphone-5c/7327
[5s]: http://www.theverge.com/products/iphone-5s/7328
[A7]: http://en.wikipedia.org/wiki/Apple_A7
[M7]: http://en.wikipedia.org/wiki/Apple_M7
[TID]: http://en.wikipedia.org/wiki/Touch_ID
