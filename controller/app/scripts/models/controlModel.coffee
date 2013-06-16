
# Control Model
# ============
# Contains the attributes for the control


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->
	
	ControlModel = Backbone.Model.extend
	
	
	return ControlModel