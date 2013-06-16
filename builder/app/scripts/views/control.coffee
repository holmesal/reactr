
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
		events: 
			'click .control-remove': 'removeControl'

		initialize: ->
			console.log 'new control view!'
			@render()
			@insert()

		insert: ->
			$('#controller').append @el

		render: ->
			console.log 'render'
			@$el.html @template @model.toJSON()

		removeControl: ->
			@options.controller.collection.remove @model
			this.remove()
			this.unbind()
			console.log 'removed control!'
	
	
	return ControlView