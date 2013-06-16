
# Available controls view
# ============
# 
# This view displays all of the available controls. You can add them to your controller by clicking a button. Etc.

define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/availableControls.html'
	'models/baseControl'

], ($, _, Backbone, handlebars, AvailableControlsTemplate, BaseControlModel) ->

	AvailableControls = Backbone.View.extend

		el: '#availableControls'

		template: handlebars.compile AvailableControlsTemplate

		events: 
			'click .control-proto' : 'addControl'

		initialize: ->
			console.log 'new available controls view'
			@render()

		render: ->
			@$el.html @template()

		show: ->
			@$el.show()

		addControl: (e) ->
			# Grab the control type
			controlType = $(e.currentTarget).attr 'data-control'

			# Add a new control to the end of the collection with the given type
			# The view will be instantiated by the collection on the add event
			@model.controller.collection.push new BaseControlModel
				type: controlType
			console.log @model.controller.collection
	
	
	return AvailableControls