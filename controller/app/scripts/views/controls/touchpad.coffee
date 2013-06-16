
# TouchpadView View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'hammer'
	'views/controls/base'
	'text!templates/touchpadOverlay.html'

], ($, _, Backbone, handlebars, hammer, BaseView, TouchpadOverlayTemplate) ->
	
	TouchpadView = BaseView.extend

		overlayTemplate: handlebars.compile TouchpadOverlayTemplate

		onclick: ->
			@$el.addClass 'control-active'
			# setTimeout =>
			# 	@$el.removeClass 'control-active'
			# ,200
			@showOverlay()

		showOverlay: ->
			# Get the window dimensions
			@winx = $(window).width()
			@winy = $(window).height()

			# Build the overlay
			@$overlay = $ @overlayTemplate
				top: @model.get('y') * @winy
				left: @model.get('x') * @winx
			@overlay = @$overlay.get 0

			# Append to body and fade in
			$('body').append @$overlay
			@$overlay.hide().fadeIn 200

			# Find close element
			close = @$overlay.find('.overlay-close-icon').get 0

			# Register touch events
			hammer(@overlay).on 'drag', (e) =>
				# @log 'drag event!'
				@dragEvent e

			# Taps cover both close events and drags
			hammer(@overlay).on 'tap', (e) =>
				# @log 'tap event!'
				if e.target is close
					@closeOverlay()
				else
					@dragEvent e
				
		dragEvent: (e) ->
			e.gesture.preventDefault()

			# @log 'dragging'
			# Get and limit event centers
			x = e.gesture.center.pageX
			x = @winx if x > @winx
			x = 0 if x < 0
			y = e.gesture.center.pageY
			y = @winy if y > @winy
			y = 0 if y < 0

			# Normalize by screen width and height
			# Set the model, which sends the event
			@model.set 'x', x/@winx
			@model.set 'y', y/@winy

			# Position the marker
			@$overlay.find('.overlay-touchmarker').css
				left: e.gesture.center.pageX
				top: e.gesture.center.pageY



		closeOverlay: ->
			# close the overlay
			@$overlay.fadeOut 200, =>
				@$overlay.remove()

			# remove the active class
			@$el.removeClass 'control-active'


	return TouchpadView