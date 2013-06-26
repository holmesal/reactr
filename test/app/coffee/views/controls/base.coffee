
# Boilerplate
# ============


define [

	'jquery'
	# 'jqueryanimateenhanced'
	'underscore'
	'backbone'
	'handlebars'
	'hammer'
	'text!templates/control.html'

], ($, _, Backbone, handlebars, hammer, ControlTemplate) ->
	
	BaseView = Backbone.View.extend

		className: 'control-container animated fadeIn'

		template: handlebars.compile ControlTemplate

		events:
			'tap .shrink-icon-container':'shrink'

		log: (words) ->
			console.log words

		initialize: ->
			# console.log hammer
			# @className += @model.get 'type'
			# @log @
			hammer(@el).on 'tap', (e) =>
				@tap(e) if @tap
				# Grow if not already grown
				if not @options.controllerView.fullscreen
					@grow()
				return false
			# Proxy hammer events if they exist, or prevent the defaults if not
			# hammer(@el).on 'dragstart', (e) =>
			# 	@dragstart(e) if @dragstart
			# 	return false
			# hammer(@el).on 'dragend', (e) =>
			# 	@dragend(e) if @dragend
			# 	return false
			# hammer(@el).on 'drag', (e) =>
			# 	console.log @model.get('type')
			# 	@drag(e) if @drag
			# 	return false
			hammer(@el).on 'swiperight', (e) =>
				@swiperight(e) if @swiperight
				return false
			hammer(@el).on 'swipeleft', (e) =>
				@swipeleft(e) if @swipeleft
				return false

			hammer(@el).on 'pinch', (e) =>
				e.gesture.stopDetect()
				@shrink()
			

			# Run a setup event, if one exists
			@setup() if @setup
			
			
			

		setSize: ->
			console.error @$el.index()
			@start = 
				width: @$el.parent().width()/2
				height: @$el.parent().height()/2

			@start.font = @start.height / 10
			if @start.font < 30
				@start.font = 30


			# @start = @$el.position()
			
			idx = @$el.index()

			loc = switch idx
				when 0 then loc =
					top: 2
					left: 2
				when 1 then loc =
					top: 2
					left: @$el.parent().width() / 2
				when 2 then loc =
					top: @$el.parent().height() / 2
					left: 2
				when 3 then loc =
					top: @$el.parent().height() / 2
					left: @$el.parent().width() / 2
			@start.top = loc.top
			@start.left = loc.left

			@$el.css
				position: 'absolute'
				top: @start.top
				left: @start.left
				width: @start.width
				height: @start.height
				fontSize: @start.font

			# console.log @model
			# console.log @options.controldims
			# Set the control size
			# @$el.css
			# 	width: @options.controldims.width
			# 	height: @options.controldims.height
			# Set the icon size
			# @$el.find('.control-icon').css
			# 	'font-size':@options.controldims.icon
			# 	'margin-top':@options.controldims.height/2 - @options.controldims.icon
			# # Set the text size
			# @$el.find('.control-name').css
			# 	'font-size':@options.controldims.text
			# 	'margin-top':@options.controldims.width/6
				# 'margin-top':@options.controldims.height/2 - @options.controldims.icon
		freeze: ->
			# @start = @$el.position()
			
			# Freeze all the siblings
			@$el.addClass 'active'
			# @$el.siblings().addClass 'frozen'
			# Turn on fullscreen mode on the controller view
			@options.controllerView.fullscreen = true

		thaw: ->
			# Unfreeze all the siblings
			# @$el.siblings().removeClass 'frozen'
			@$el.removeClass 'active'
			# Turn off fullscreen mode on the controller view
			@options.controllerView.fullscreen = false
			
		grow: ->
			# Absolutely position everyone
			@freeze()
			# @$el.css
			# 	top: @start.top
			# 	left: @start.left

			# Grow animation
			@$el.animate
				top: 0
				left: 0
				width: @$el.parent().width()
				height: @$el.parent().height()
				fontSize: @start.font*1.5
			, 
				duration: 200
				# queue: false

			# Show things for the full screen view
			@$el.find('.show-fullscreen').animate
				opacity: 1
			, 400

		shrink: ->
			# @thaw()
			# Shrink animation
			@log 'shrink called!'
			@$el.animate
				top: @start.top
				left: @start.left
				width: @start.width
				height: @start.height
				fontSize: @start.font
			,
				duration: 200
				# queue: false
				complete: =>
					@thaw()
					@log 'thaw called!'

			# Hide things for the full screen view
			@$el.find('.show-fullscreen').animate
				opacity: 0
			,200

		render: ->
			# Set the control size
			@$el.html @template(@model.toJSON())
			@$el.addClass @model.get 'type'
			return @$el

	return BaseView