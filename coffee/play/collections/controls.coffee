
# Controls Collection
# ============


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->
	
	ControlsCollection = Backbone.Collection.extend

		initialize: ->
			console.log 'new controls collection'
	
	
	return ControlsCollection