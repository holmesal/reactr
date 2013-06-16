
# Builder Model
# ============
# 
# Contains the controller model, the socket connection, and other fun stuff.


define [

	'jquery'
	'underscore'
	'backbone'
	'models/controller'

], ($, _, Backbone, ControllerModel) ->
	
	BuilderModel = Backbone.Model.extend

		initialize: ->
			
			console.log 'new builder model'

			@controller = new ControllerModel
	
	
	return BuilderModel