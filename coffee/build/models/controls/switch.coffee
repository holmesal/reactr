
# Boilerplate
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'build/models/controls/base'

], ($, _, Backbone, BaseControl) ->
	
	# Extend base control
	Switch = BaseControl.extend 

		initialize: ->
			@updateThings()
			@set 'type','switch'
			# Set some smart defaults
			@set 'name-display',@randomName('switch')
			@set 'description',@randomDescription()
			@set 'icon','icon-off'

		# defaults:
		# 	age: 20
	
	return Switch