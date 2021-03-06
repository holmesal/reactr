
# AccelerometerView View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/base'

], ($, _, Backbone, BaseView) ->
	
	AccelerometerView = BaseView.extend

		setup: ->
			@model.set 'description', 'Tilt your device to send accelerometer data.'

		onclick: ->
			@$el.addClass 'control-active'
			setTimeout =>
				@$el.removeClass 'control-active'
			,200
			# if @$el.hasClass 'control-active'
			# 	@$el.removeClass 'control-active'
			# 	# Set things on the model
			# else
			# 	@$el.addClass 'control-active'
			# 	# Set things on the model

	return AccelerometerView