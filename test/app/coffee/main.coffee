
# Main
# ============

# Configure require
require.config
	paths:
		jquery: '../bower_components/jquery/jquery'
		# jqueryanimateenhanced: '../bower_components/jquery-animate-enhanced/jquery-animate-enhanced.min'
		underscore: '../bower_components/underscore-amd/underscore'
		backbone: '../bower_components/backbone-amd/backbone'
		handlebars: '../bower_components/handlebars/handlebars'
		text: '../bower_components/requirejs-text/text'
		hammer: '../bower_components/hammerjs/dist/hammer.min'
		backboneiobind: '../bower_components/backbone.iobind/dist/backbone.iosync'
		# context: 'libs/context/context'
		# socketio: 'http://localhost:7076/socket.io/socket.io'
		# socketio: 'http://192.168.2.3:7076/socket.io/socket.io'
		socketio: 'http://api.reactr.co/socket.io/socket.io'

	shim:
		backbone:
			deps: ['underscore','jquery'],
			exports: 'Backbone'
		underscore:
			exports: '_'
		handlebars:
			exports: 'Handlebars'
		hammer:
			exports: 'Hammer'
		backboneiobind:
			deps: ['backbone','jquery']
			exports: 'Backbone'
		context:
			exports: 'Context'
		# jqueryanimateenhanced:
		# 	deps: ['jquery']
		# 	exports: 'jquery'


# Load app.js via require

require ['app'], (App) ->
	# Initialize the app to kick things off
	window.app = 
		app: App
		collections: {}
		models: {}
		views: {}
	App.initialize()