
# Base Control
# ============


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->


	
	ControllerModel = Backbone.Model.extend

		initialize: ->
			console.log('new controller model yo!')

	return ControllerModel