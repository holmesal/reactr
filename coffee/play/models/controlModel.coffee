
# Control Model
# ============
# Contains the attributes for the control


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->
	
	ControlModel = Backbone.Model.extend

		defaults:
			icon: 'icon-arrow-up'
			'name-display': 'Some Name'
	
	
	return ControlModel