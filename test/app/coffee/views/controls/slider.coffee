
# Slider View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/base'

], ($, _, Backbone, BaseView) ->
	
	SliderView = BaseView.extend

		setup: ->
			@model.set 'description', 'Take this control out.'

	return SliderView