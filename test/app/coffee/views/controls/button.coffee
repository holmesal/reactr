
# Button View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/base'

], ($, _, Backbone, BaseView) ->
	
	Button = BaseView.extend

		setup: ->
			@model.set 'description', 'Tap to send event.'

		# onclick: ->
		# 	# Show as active, but only for a bit
		# 	@$el.addClass 'control-active'
		# 	setTimeout =>
		# 		@$el.removeClass 'control-active'
		# 	,200

			# Show the burp
			# $('body').Burp
			# 	message: @model.get('name-display')+' clicked'
			# 	debug: true

			# if @$el.hasClass 'control-active'
			# 	@$el.removeClass 'control-active'
			# 	# Set things on the model
			# else
			# 	@$el.addClass 'control-active'
			# 	# Set things on the model

	return Button