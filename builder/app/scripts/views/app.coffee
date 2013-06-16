
# Application View
# ============


define [

	'jquery'
	'translate3d'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/app.html'

], ($, translate3d, _, Backbone, handlebars, AppTemplate) ->
	
	AppView = Backbone.View.extend

		el: '#page'

		events:
			'click #sidebar-toggle' : 'toggleSidebar'

		template: handlebars.compile AppTemplate

		initialize: ->
			console.log 'new app view!'
			@render()

		render: ->
			@$el.html @template()

		toggleSidebar: ->
			console.log $('#app').position().left
			if $('#app').position().left > 0
				@hideSidebar()
			else
				@showSidebar()

		showSidebar: ->
			# slide out the sidebar
			$('#sidebar-toggle').addClass 'rotated'
			$('#app').animate
				left: 300
			,
				duration: 200
				complete:  ->
					$('#app').one 'click', ->
						console.log 'fired!'
						reactr.appView.hideSidebar()

			# $('#sidebar-toggle').animate
			# 	left: 260
			# ,200

		hideSidebar: ->
			# slide back the sidebar
			$('#sidebar-toggle').removeClass 'rotated'
			$('#app').animate
				left: 0
			,
				duration: 200,
				complete: ->
	
	
	return AppView