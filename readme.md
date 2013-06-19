
A frontend for the internet of things
===

Reactr will allow you to build a simple web-based controller for a physical device. Drag and drop controls like buttons, switches, and accelerometers, and get a dedicated URL. Visit that URL on a phone, tablet, or computer, and interact with your controller. Data is pushed in realtime to your arduino, pi, imp, etc.

Reactr is a work in progress. 

Build a controller
---

Drag and drop controls at reactr.co to build a controller.

Use a controller
---

Visit reactr.co/your-controller-url, preferably on a mobile device. Any time you interact with your controller (or in other special circumstances), data will be sent in real time to your device.

Available controls
---

* The switch
 * Turn things on, and turn them off again. Sends true/false.
* The button
 * Press to make something happen. Sends true when pushed, is false otherwise.
* The accelerometer
 * Tilt your phone/tablet. Sends x and y values, as a percentage of maximum.
* The touchpad
 * Drag your finger/mouse around. Sends x and y values, as a percentage of maximum
* GPS
 * Move about the world. Sends lat and lon.

Device requirements
---

For awesome blistering speed, you should have a device that can set up a websocket connection with api.reactr.co. Normal HTTP requests work as well, but are significantly slower.

In theory, reactr will work with any device that can connect to the internet and make HTTP requests. 




