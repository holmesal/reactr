
# Control View
# ============
# 
# All of the controls have the same view for now.


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/control.html'

], ($, _, Backbone, handlebars, ControlTemplate) ->
	
	ControlView = Backbone.View.extend

		className: 'control'

		template: handlebars.compile ControlTemplate

		# This isn't working because the view isn't being bound to an element so there's othing there when this thing gets attached in the start
		# events: 
		# 	'click .control-remove': 'removeControl'

		initialize: ->
			console.log 'new control view!'

		render: ->
			console.log 'control render'
			@$el.html @template @model.toJSON()

		registerEvents: ->
			@$el.find('.control-remove').click => 
				@removeControl()

		removeControl: ->
			@model.collection.remove @model
			this.remove()
			this.unbind()
			console.log 'removed control!'
	
	
	return ControlView