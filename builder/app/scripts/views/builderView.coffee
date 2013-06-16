
# Builder View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'backboneiobind'
	'handlebars'
	'bootstrap'
	'text!templates/builder.html'
	'models/controller'
	'views/availableControls'
	'views/controllerInfo'
	'views/logs'

], ($, _, Backbone, backboneiobind, handlebars, bootstrap, BuilderTemplate, ControllerModel, AvailableControlsView, ControllerInfoView, LogsView) ->
	
	BuilderView = Backbone.View.extend

		el: '#app'

		template: handlebars.compile BuilderTemplate

		events:
			'click .tab-trigger' : 'tabTrigger'

		initialize: ->
			console.log 'new build view!'
			@render()

			# Model for controller

			# console.log controllerModel

			# View for phone controls

			# View for each tab
			@tabs = 
				availableControls: new AvailableControlsView
							model: @model
				controllerInfo: new ControllerInfoView
							model: @model
				logs: new LogsView
							model: @model


		render: ->
			@$el.html @template

		tabTrigger: (e) ->
			tab = $(e.currentTarget)
			if not tab.parent().hasClass 'active'
				@showTab tab

		showTab: (tab) ->
			console.log 'showing tab: ' + tab.attr('data-tab')
			# Fade out all tabs and remove all active classes
			$('.tab-body').hide()
			$('.tab-trigger').parent().removeClass 'active'

			# Show the right tab
			@tabs[tab.attr('data-tab')].show()
			tab.parent().addClass 'active'

	
	
	return BuilderView