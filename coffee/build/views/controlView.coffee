
# Control View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'build/models/controls/switch'
	'text!templates/control.html'
	'build/views/editControlView'

], ($, _, Backbone, Handlebars, SwitchModel, ControlTemplate, EditControlView) ->
	
	ControlView = Backbone.View.extend

		tagName: 'div'

		className: 'control'

		template: Handlebars.compile(ControlTemplate)

		events:
			'click':'clickEvent'

		initialize: ($dropped)->

			# What kind of control is this?
			console.log $dropped.hasClass('control-switch')
			if $dropped.hasClass('control-switch')
				@model = new SwitchModel
				@controlClass = 'control-switch'
			# else if $dropped.hasClass('control-accelerometer')

			# else if $dropped.hasClass('control-touchpad')

			# else if $dropped.hasClass('control-button')
			@render()
			@$el.insertAfter($dropped)
			$dropped.remove()
			# Remove the dropped item
			# $dropped.remove()
			
			# Show the edit view
			@focusOn()
			window.app.views.editControlView = new EditControlView
				model: @model
			
			# Listen for model change events
			@listenTo @model,'change',@render

		render: ->
			@$el.html(@template(@model.toJSON()))
			@$el.addClass(@controlClass)
			@$el.addClass('backbone')

		focusOn: ->
			@$el.animate({opacity:1})
			$('.control').not(@$el).animate({opacity:0.4},300)

		clickEvent: (e) ->
			# Don't show the right pane on drags
			if not $(e.currentTarget).hasClass('ui-sortable-helper')
				# Kill any of the old edit views
				if window.app.views.editControlView
					window.app.views.editControlView.undelegateEvents()
				# Fade out the other controls
				@focusOn()
				# Show the edit view
				window.app.views.editControlView = new EditControlView
					model: @model
	
	
	return ControlView