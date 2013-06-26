
# Le Router
# ============

# *Handles incoming requests, pulls out data, fire the appropriate handlers*


# Include some shit
define [

	'jquery'
	'underscore'
	'backbone'
	'models/controllerModel'
	'views/controllerView'

], ($, _, Backbone, ControllerModel, ControllerView) ->
	
	# New router
	AppRouter = Backbone.Router.extend
		# Define some routes
		routes:
			':controller':'controllerRoute'

	initialize = ->

		# New app router
		app_router = new AppRouter

		app_router.on 'route:landingRoute', ->
			console.log 'landingRoute!'
			window.app.views.main = new MainView

		app_router.on 'route:controllerRoute', (name) ->
			console.log 'controller route: '+name
			# Set up the controller
			controller = window.app.models.controller = new ControllerModel
				name: name
			window.app.views.controller = new ControllerView
				model: window.app.models.controller

		# If we don't know what's up, just log the attempted action
		# app_router.on 'route:defaultAction', (actions) ->
		# 	console.log 'No route: ' + actions

		Backbone.history.start()
			# pushState: true
			# root: '/'


	# Return the init function 
	return{
		initialize: initialize
	}