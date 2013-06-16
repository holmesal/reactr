
# Logs view
# ============
# 
# This view displays real-time logs from the controller, device, builder. Useful shit.
define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/logs.html'

], ($, _, Backbone, handlebars, LogsTemplate) ->

	Logs = Backbone.View.extend

		el: '#logs'

		template: handlebars.compile LogsTemplate

		initialize: ->
			console.log 'new logs view'
			@render()

			# Hide this view
			@hide()

		render: ->
			@$el.html @template()

		hide: ->
			@$el.hide()

		show: ->
			@$el.show()
	
	
	return Logs