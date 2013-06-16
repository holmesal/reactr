
# Main
# ============

# Configure require
require.config
	paths:
		jquery: '../bower_components/jquery/jquery'
		underscore: '../bower_components/underscore-amd/underscore'
		backbone: '../bower_components/backbone-amd/backbone'
		handlebars: '../bower_components/handlebars/handlebars'
		text: '../bower_components/requirejs-text/text'
		bootstrap: 'vendor/bootstrap'
		socketio: 'http://localhost:7076/socket.io/socket.io'
		backboneiobind: '../bower_components/backbone.iobind/dist/backbone.iosync'
		translate3d: '../bower_components/jquery-animate-enhanced/jquery-animate-enhanced'

	shim:
		backbone:
			deps: ['underscore','jquery'],
			exports: 'Backbone'
		underscore:
			exports: '_'
		handlebars:
			exports: 'Handlebars'
		bootstrap:
			deps: ['jquery']
			exports: 'jquery'
		backboneiobind:
			deps: ['backbone']
			exports: 'Backbone'
		translate3d:
			deps: ['jquery']
			exports: 'jquery'


# Load app.js via require

require ['app'], (App) ->
	# Initialize the app to kick things off
	app = new App