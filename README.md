Reactr
==============

Gimme the one-liner
------------------

Twitter Bootstrap for physical devices.


Whaddya mean, physical device?
------------------

Anything with a brain and an internet connection. Think prototyping platforms like Arduino, Launchpad, RaspberryPi, or Electric Imp. 

Whaddya mean, twitter bootstrap?
------------------

A simple, quick, free way to get something that looks good and performs as expected. The whole point of a prototyping platform like Arduino (as well as a web framework like Bootstrap) is that it's fast. However, if you want to control your project with anything besides physical buttons and switches (like your phone or computer), things get pretty crazy. You start needing little bits of knowledge like how websockets work and how browsers handle touch events. Stuff that's great to know, but that you don't always want to spend time on when you're just trying to get your goddamn garage door to open when you press a button on your phone.

So that's what Reactr does really well. You go to a website, pick a couple of controls, tweak some options, and get a URL. Hit that URL on your phone, tablet, or computer, and presto! You've got buttons, switches, touchpads, accelerometers, geolocation, and more. All of this data is streamed to your Arduino/Launchpad/Pi/Imp in real time.


Example plz.
------------------

Open your garage door when you get within a certain distance of your house. Close it by swiping down on your phone. Turn on your coffeemaker by pressing a button. Control a model helicopter by tilting your phone.

All of these controls live on the web, so you can access them from anywhere. All of them work with touches, as well as clicks. And of course, they're beautifully designed.


Cool. But why?
------------------

Mostly because it's awesome. But there's also some pain here - whenever I found myself trying to use my phone to control an Arduino or Electric Imp, I would get sidetracked configuring my wireless router, or getting touch events working properly, or any one of a hundred other pitfalls. I'm a frontend developer, so I love learning this stuff, but I frequently just want something that works.

It's also a huge enabler. Reactr basically gives everyone that works with electronics a quick, easy way to tap into all of the sensors and capabilities of the smartphone. That's a lot of people with a new set of lego bricks.  


What's built?
------------------

The builder frontend is just about ready to beta. The backend is lagging, but it'll be quick (there's not much there). The controller frontend skeleton is there, as are the libraries for touch interactions / accelerometers / location, but the individual controls need some design love.

The frontend is written in Backbone.js. It uses socket.io (realtime) to talk to a node.js server that takes care of state and pushing the data to the device.

I'm launching it on Electric Imp first, because they're the only platform that provides a URL to post data to, out-of-the-box. They're also an excellent startup founded by ex- gmail and iPhone product people. Adding other platforms is not much of a challenge on the Reactr side - it's more that to make Reactr really accessible to, say, the Arduino community, someone should really write an Arduino library.

Check out the semi-unstable (pity the fool who adds anything but a switch) [builder demo](http://www.alonsoholmes.com/reactr) if you like - at your own risk if you're not in Google Chrome.


Why do you want a designer?
------------------

It's funny. I actually pride myself on being able to throw together things that are functionally and aesthetically passable. I'm far from a designer by trade, but I've picked up some skills along the way.

However, I'm way out of my depth here. This is so much deeper than the visual look. I'm asking you to craft an touch interface for physical devices - something that doesn't really exist yet, and certainly isn't mainstream.

These are fun questions. "If I want to press a button on my phone to open my garage door, what's the best way to communicate the current state of the door, and show me that I can change that state by pressing?" Reactr is the first platform of it's kind, and it's very possible that the design language we create will have a broad effect on similar interfaces.


How can I get in touch?
-------------------

Email's good. siralonsoholmes@gmail.com
Or just send a raven.

*-Alonso*