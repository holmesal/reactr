
# Control Model
# ============
# Contains the attributes for the control


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/switch'
	'views/controls/button'
	'views/controls/touchpad'
	'views/controls/accelerometer'

], ($, _, Backbone, SwitchView, ButtonView, TouchpadView, AccelerometerView) ->
	
	ControlModel = Backbone.Model.extend

		initialize: ->

			type = @get 'type'
			
			viewProto = switch
				when type is 'switch' then SwitchView
				when type is 'button' then ButtonView
				when type is 'touchpad' then TouchpadView
				when type is 'accelerometer' then AccelerometerView
				when type is 'slider' then SliderView
				when type is 'gps' then GpsView

			@set 'viewProto',viewProto
	
	return ControlModel