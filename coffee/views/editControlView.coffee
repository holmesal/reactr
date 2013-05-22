
# Edit Pane View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/editControl.html'

], ($, _, Backbone, Handlebars, EditControlTemplate) ->
	
	EditControlView = Backbone.View.extend

		el: '#pane-right'

		template: Handlebars.compile EditControlTemplate

		events:
			'click .display-icon-container':'iconChosen'
			'keyup #input-name':'nameUpdate'
			'keyup #input-description':'descriptionUpdate'
			'click #saveReturn':'saveReturn'
			

		initialize: ->
			# Listen and re-render on change events - only on the icon
			@listenTo @model,'change:icon',@render
			# Create a new phone collection and view
			@animateIn()

			# Enter key listener
			$(document).keypress (e) =>
				if e.keyCode is 13
					@saveReturn()

		animateIn: ->
			# Fade out right side
			$('#pane-right').animate
				opacity: 0
			,200
			,=>
				# Fade in all of the controls
				$('.control').animate({opacity:1},300)
				# Show the edit html
				@render()
				$('#pane-right').animate
					opacity: 1
				,200
			

		render: ->
			@$el.html(@template(@model.toJSON()))

		iconChosen: (e) ->
			icon = $(e.currentTarget).find('.display-icon').attr('data-icon-name')
			@model.set 'icon', icon

		nameUpdate: (e) ->
			name = $(e.currentTarget).val()
			if name.length < 19
				@model.set 'name-display', name
				# Updating by hand here to avoid text refocus issues
				$('#name-display').html(name)
			else
				$('#input-name').val(name.substr(0,18))

		descriptionUpdate: (e) ->
			desc = $(e.currentTarget).val()
			if desc.length < 24
				@model.set 'description', desc
				# Updating by hand here to avoid text refocus issues
				# $('#name-display').html(name)
			else
				$('#input-description').val(desc.substr(0,23))

		saveReturn: ->
			window.app.views.editPaneView.animateIn()
			# console.log @
			@undelegateEvents()

		keydownEvent: (e) ->
			console.log e
	
	
	return EditControlView