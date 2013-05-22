
# Edit Pane View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/prelaunch.html'

], ($, _, Backbone, Handlebars, PrelaunchTemplate) ->
	
	PrelaunchView = Backbone.View.extend

		el: '#pane-right'

		template: Handlebars.compile PrelaunchTemplate

		initialize: ->
			

		animateIn: ->
			# Fade out right side
			$('#pane-right').animate
				opacity: 0
			,200
			,=>
				# Show the edit html
				@render()
				$('#pane-right').animate
					opacity: 1
				,200
			

		render: ->
			@$el.html(@template(@model.toJSON()))
	
	
	return PrelaunchView