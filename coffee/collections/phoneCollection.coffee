
# Boilerplate
# ============


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->
	
	PhoneCollection = Backbone.Collection.extend

		initialize: ->

			console.log "'it's a collection!"
	
	
	return PhoneCollection