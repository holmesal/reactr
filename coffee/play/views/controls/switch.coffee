
# Switch View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'play/views/controls/base'

], ($, _, Backbone, BaseView) ->
	
	SwitchView = BaseView.extend

		onclick: ->
			if @$el.hasClass 'control-active'
				@$el.removeClass 'control-active'
				# Set things on the model
			else
				@$el.addClass 'control-active'
				# Set things on the model

	return SwitchView