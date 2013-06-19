Redesign
========

Builder
--------------

* Login/auth
* Icon select
* Control naming
* Control availability (ios, android, desktop)
    * Useful for controls like the accelerometer, gps, etc
* Realtime logs
    * Parse event stream from controller, and make it pretty
* Device info
    * Easy-to-read breakdown of array indexes and data
    * Updates as changes are made to controller
    * Notification to check this after changes made?

Controller
---------------

* Rerender on controller layout change from builder
* "fallback mode" for evil browsers?
* Test with realtime logs
    * Accelerometer
    * Slider
    * Touchpad

Backend
---------------

* Namespace socket connections
* Require auth on socket setup?
* Store current controller build in memory, periodically sync to mongo
