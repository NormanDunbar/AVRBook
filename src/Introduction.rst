Introduction
============

This book is for those of us who have played with, and perhaps mastered, the Arduino in its various forms, and who need now to move up to programming it - or home made clones on breadboards or stripboard (or even, home made PCBs) and so on - in plain vanilla C code.

This need could be for many reasons, running out of space, too slow, lots of hidden things going on that are interfering with the project we have in mind etc. You might even have found that you can replace a full Arduino with a small AtTiny85, for example, and get exactly the same results, for a lot less outlay.

This book should help with that migration. It's not difficult, but it's not easy either. You will have to think a lot more at the hardware level, which the Arduino environment abstracts away for you, to make it simple.

Interrupts, timers and sleep modes will figure largely in what we do with AVR programming - we don't want to be wasting time waiting for someone to press a switch, or a sensor to register a reading, for example. And if there's nothing for the AVR to do while it waits around, we let it sleep! This saves power and could mean the difference between your project being able to run for months, if not years, on a couple of batteries, and having to be constantly plugged into the mains.

Just remember, ``delay()`` is not your best friend when programming the Arduino or the AVR. Hopefully, you will find this out later when you read on.

Hardware Necessary
------------------

*   An Arduino, perhaps. It's not essential, but you can use one to program bare AVR microcontrollers if you don't have a ISP programmer. A *Nano* or *Uno* etc are probably best. The Mega is perhaps a tad overkill as an ISP programmer!

*   If you don't have a spare Arduino lying around, then you will need an ISP programmer. I got mine on eBay for around £3.28 including postage, from a seller named finetech007, in China. Other suppliers are available. The programmer allows you to save the 2Kb that an Arduino bootloader takes up, but obviously stops you programming the device using that bootloader.

    Don't worry if you don't have an ISP programmer, as mentioned above, your existing Arduino can be used to program (other) AVR micro-controllers. And if you don't have an Arduino, why not build your own? Grab hold of a `Protected Shrimp <http://start.shrimping.it/project/protected/build.html>`_ kit for around £10.00\ [1]_, or a more permanent (some soldering required) `Copper Shrimp <http://start.shrimping.it/kit/stripboard.html>`_ add on kit for £1.90 from those nice people at `ShrimpingIT <http://start.shrimping.it//index.html>`_. I started with an Arduino Duemilanove which was bought for me as a gift, but I built my own Shrimp Kit just for the fun of it. I've built a few more since then!

* A breadboard and assorted components, wires, etc. This is limited to the odd switch, LED and such like. Maybe a shift register or two will be handy - it depends on what you are expecting to achieve with the AVR. (Or, what I decide to include in the book!)


Coming Up
---------

..  To Be Confirmed.


..  [1] Prices correct at the time of writing.