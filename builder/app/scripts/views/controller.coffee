
# Controller Info
# ============
# 
# This view displays everything you need to write your device-side code. Your current data model, indexes, and all that jazz

define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/controller.html'
	'views/control'

], ($, _, Backbone, handlebars, ControllerTemplate, ControlView) ->

	ControllerView = Backbone.View.extend

		el: '#controller'

		template: handlebars.compile ControllerTemplate

		controlViews: []

		log: (words) ->
			console.log words

		initialize: ->
			console.log 'new controller view'
			@render()

			# Register change events
			# console.log @model.controller.collection
			@listenTo @model.controller.collection, 'add', @addControl
			@listenTo @model.controller.collection, 'remove', @removeControl
			# @listenTo @model.controller.collection, 'sort', @render

			# Go through each of the controls in the collection, and add a new view for each of them
			@buildViews()

		addControl: (added) ->
			@log 'adding control!'
			# Create a new view for this control and push it onto the @controlViews array
			newView = new ControlView 
				model: added
			@controlViews.push newView

			# Listen to remove event on view

			# Render to update the view
			@render()

		removeControl: (removed) ->
			@log 'removed control!'

			# Remove the view from the collection
			@log 'find'
			@controlViews = _.without(@controlViews,_.findWhere @controlViews,
				model:removed)

			@render()




		buildViews: ->
			console.log 'building views!'
			console.error 'build the views here !!!'
			# @model.controller.collection.forEach (elem,idx) ->
			# 	@log elem

		render: ->
			@log 'render!'
			if @controlViews.length > 0
				@$el.html ''
				_.each @controlViews, (view,idx) =>
					@$el.append view.render()
					view.registerEvents()
			else
				@$el.html "<p>You haven't added any controls yet. <a href='#availableControls' data-toggle='modal'>Add one now</a></p>"
			# console.log
			# 	controller: @model.controller.toJSON()
			# 	collection: @model.controller.collection.toJSON()
			# @$el.html @template
			# 	controller: @model
			# 	collection: @model.controller.collection.toJSON()
	
	
	return ControllerView