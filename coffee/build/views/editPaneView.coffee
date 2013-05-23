
# Edit Pane View
# ============


define [

	'jquery'
	'jqueryui'
	'underscore'
	'backbone'
	'build/views/phoneView'
	'handlebars'
	'build/collections/phoneCollection'
	'text!templates/editPane.html'
	'build/models/controller'
	'build/views/prelaunchView'

], ($, jqueryui, _, Backbone, PhoneView, Handlebars, PhoneCollection, EditPaneTemplate, ControllerModel, PrelaunchView) ->
	
	EditPaneView = Backbone.View.extend

		el: '#pane-right'

		template: Handlebars.compile EditPaneTemplate

		events:
			'click #impSetup':'showImpSetup'

		initialize: ->
			# Create a new phone collection and view
			@phoneCollection = new PhoneCollection
			@phoneView = new PhoneView
				collection: @phoneCollection

			# Create a new controller model and prelaunch view
			window.app.models.controller = @controllerModel = new ControllerModel
				collection: @phoneCollection

			window.app.views.prelaunchView = @prelaunchView = new PrelaunchView
				model: @controllerModel

		getStarted: ->
			# Switch the phone view
			@phoneView.getStarted()

			@animateIn()
		animateIn: ->
			# Fade out right side
			$('#pane-right').animate
				opacity: 0
			,200
			,=>
				# Show the edit html
				@render()
				$('#pane-right').animate
					opacity: 1
				,200
				,=>
					@dragInit()
			

		render: ->
			@$el.html(@template())
			

		dragInit: ->

			$( '#controlBank' ).children().draggable
		      connectToSortable: '#phoneScreen'
		      helper: 'clone'
		      revert: 'invalid'

		showImpSetup: ->
			@prelaunchView.animateIn()

	
	
	return EditPaneView