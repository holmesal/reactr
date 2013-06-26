
# Switch View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/base'

], ($, _, Backbone, BaseView) ->
	
	SwitchView = BaseView.extend

		setup: ->
			@model.set 'description', 'Press to toggle.'

		# onclick: ->
		# 	if @$el.hasClass 'control-active'
		# 		@switchOn()
		# 	else
		# 		@switchOff()

		# switchOn: ->
		# 	@model.set 'value',0
		# 	@$el.removeClass 'control-active'
		# 	$('body').Burp
		# 		message: @model.get('name-display')+' turned off'
		# 		debug: true

		# switchOff: ->
		# 	@model.set 'value',1
		# 	@$el.addClass 'control-active'
		# 	$('body').Burp
		# 		message: @model.get('name-display')+' turned on'
		# 		debug: true

	return SwitchView