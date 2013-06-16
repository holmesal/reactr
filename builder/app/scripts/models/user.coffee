
# User Model
# ============


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->
	
	UserModel = Backbone.Model.extend

		defaults:
			loggedin: true

		initialize: ->
			# Parse the data passed back and make the controllers
			console.log 'new user model!'
	
	
	return UserModel