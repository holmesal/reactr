
# GPS View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/base'

], ($, _, Backbone, BaseView) ->
	
	GpsView = BaseView.extend

		setup: ->
			@model.set 'description', 'Drag the slider up or down to send data.'

	return GpsView