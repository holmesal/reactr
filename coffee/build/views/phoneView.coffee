
# Boilerplate
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'build/views/controlView'

], ($, _, Backbone, ControlView) ->
	
	PhoneView = Backbone.View.extend

		el: '#phoneScreen'

		initialize: ->
			@render()
			$('#phoneScreen').sortable
				revert: true
				receive: @newItem

		render: ->
			if @collection.length is 0
				# @$el.html('<h2 id="dragHere">Drag controls here.</h2>')
				console.log 'hey'

		getStarted: ->
			$('#phoneScreen').animate
				opacity: 1
			,200

		newItem: (e,ui) ->
			# Find the new item
			dropped = $('#phoneScreen').children().not('.backbone')[0]
			# Create a new view for this item - let the view define the model
			controlView = new ControlView $(dropped)
	
	
	return PhoneView