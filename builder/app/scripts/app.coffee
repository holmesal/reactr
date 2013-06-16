
# The App!
# ============

# *You know, start the router and stuff...*


# Include some shit
define [

	'jquery'
	'underscore'
	'backbone'
	'routes/router'
	'views/app'
	'models/user'
	'views/sidebar'

], ($, _, Backbone, Router, AppView, UserModel, SidebarView) ->

	AppModel = Backbone.Model.extend

		initialize: ->

			# Put the app in the global namespace
			window.reactr = 
				appModel: @

			# Make the app view
			appView = window.reactr.appView = new AppView

			# Make the user model
			user = window.reactr.userModel = new UserModel

			# Make the sidebar view
			sidebar = window.reactr.sidebarView = new SidebarView

			# Initialize the router
			Router.initialize()

		connect: ->
			alert window.reactr.something

	# Return some other shit
	return AppModel