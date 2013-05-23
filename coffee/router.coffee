
# Le Router
# ============

# *Handles incoming requests, pulls out data, fire the appropriate handlers*


# Include some shit
define [

	'jquery'
	'underscore'
	'backbone'
	'build/views/mainView'
	'play/models/controllerModel'
	'play/views/controllerView'

], ($, _, Backbone, MainView, ControllerModel, ControllerView) ->
	
	# New router
	AppRouter = Backbone.Router.extend
		# Define some routes
		routes:
			'':'landingRoute'
			'controller':'controllerRoute'
			'*actions':'defaultAction'

	initialize = ->

		# New app router
		app_router = new AppRouter

		app_router.on 'route:landingRoute', ->
			console.log 'landingRoute!'
			window.app.views.main = new MainView

		app_router.on 'route:controllerRoute', ->
			console.log 'controller route!'
			window.app.models.controller = new ControllerModel
			window.app.views.controller = new ControllerView
				model: window.app.models.controller

		# If we don't know what's up, just log the attempted action
		app_router.on 'route:defaultAction', (actions) ->
			console.log 'No route: ' + actions

		Backbone.history.start()


	# Return the init function 
	return{
		initialize: initialize
	}