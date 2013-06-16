
# Base control model
# ============
# 
# This is a placeholder model for now - later on, each of the individual control models will extend this one


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->
	
	BaseControlModel = Backbone.Model.extend

		initialize: ->
			console.log 'new control model!'
			@setDefaults()

		setDefaults: ->
			console.log 'type: '+@get 'type'
			switch @get 'type'
				when 'switch'
					console.log 'its a switch'
					@set 'icon','icon-rocket'
					@set 'name','Switch'
				when 'button'
					console.log 'its a button'
					@set 'icon','icon-fire-extinguisher'
					@set 'name','Button'
				when 'accelerometer'
					console.log 'its a accel'
					@set 'icon','icon-gamepad'
					@set 'name','Accelerometer'
				when 'slider'
					console.log 'its a slider'
					@set 'icon','icon-anchor'
					@set 'name','Slider'
				when 'touchpad'
					console.log 'its a touchpad'
					@set 'icon','icon-html5'
					@set 'name','Touchpad'
				when 'gps'
					console.log 'its a gps'
					@set 'icon','icon-bullseye'
					@set 'name','GPS'
	
	
	return BaseControlModel