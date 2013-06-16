
# Le Router
# ============

# *Handles incoming requests, pulls out data, fire the appropriate handlers*


# Include some shit
define [

	'jquery'
	'underscore'
	'backbone'
	'views/builderView'
	'models/builder'
	# 'models/controllerModel'
	# 'views/controllerView'

], ($, _, Backbone, BuilderView, BuilderModel) ->
	
	# New router
	AppRouter = Backbone.Router.extend
		# Define some routes
		routes:
			'':'landingRoute'
			'build':'buildRoute'
			'*notFound':'defaultRoute'

	initialize = ->

		# New app router
		app_router = new AppRouter


		app_router.on 'route:landingRoute', ->
			console.log 'landing route!'
			# window.app.views.main = new BuilderView

		app_router.on 'route:buildRoute', ->
			console.log 'build route!'
			if reactr.userModel.get 'loggedin'
				new BuilderView
					model: new BuilderModel
			else
				reactr.sidebarView.show()

		app_router.on 'route:defaultRoute', (route) ->
			console.log 'Unknown route: '+route

		# app_router.on 'route:controllerRoute', (controllerid) ->
		# 	console.log 'controller route!'
		# 	console.log controllerid
		# 	window.app.models.controller = new ControllerModel
		# 	window.app.views.controller = new ControllerView
		# 		model: window.app.models.controller

		# If we don't know what's up, just log the attempted action
		# app_router.on 'route:defaultAction', (actions) ->
		# 	console.log 'No route: ' + actions

		Backbone.history.start()
			# pushState: true


	# Return the init function 
	return{
		initialize: initialize
	}