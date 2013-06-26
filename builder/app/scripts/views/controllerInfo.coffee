
# Controller Info
# ============
# 
# This view displays everything you need to write your device-side code. Your current data model, indexes, and all that jazz

define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/controllerInfo.html'

], ($, _, Backbone, handlebars, ControllerInfoTemplate) ->

	ControllerInfo = Backbone.View.extend

		el: '#controllerInfo'

		# className: 'tab-hidden'

		template: handlebars.compile ControllerInfoTemplate

		initialize: ->
			console.log 'new controller info view'
			@render()

			# Register change events
			# console.log @model.controller.collection
			@listenTo @model.controller.collection, 'add', @render
			@listenTo @model.controller.collection, 'remove', @render
			@listenTo @model.controller.collection, 'remove', @render



		render: ->
			console.log 'render!'
			console.log
				controller: @model.controller.toJSON()
				collection: @model.controller.collection.toJSON()
			@$el.html @template
				controller: @model.controller.toJSON()
				collection: @model.controller.collection.toJSON()
	
	
	return ControllerInfo