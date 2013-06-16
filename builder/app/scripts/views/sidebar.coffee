
# Sidebar View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/sidebar.html'

], ($, _, Backbone, handlebars, SidebarTemplate) ->
	
	SidebarView = Backbone.View.extend

		el: '#sidebar'

		template: handlebars.compile SidebarTemplate

		initialize: ->
			console.log 'new sidebar view!'

			@render()

			# pull the newest data from the server whenever a new controller is added?
			# or push new controllers to the server when someone adds them here?

		render: ->
			# Login vs controller list is in the template logic, so pass in the user and the list of controllers
			console.log reactr
			@$el.html @template
				user: reactr.userModel.toJSON()
				# controllers: 
	
	
	return SidebarView