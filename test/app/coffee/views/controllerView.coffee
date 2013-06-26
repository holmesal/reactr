
# Controller View
# ============
# Responsible for building the visual aspects of the controller
# 
# 
# Bug - drag a control off the screen. Bahhh


define [

	'jquery'
	'underscore'
	'backbone'
	'hammer'
	'views/controls/switch'
	'models/controlModel'

], ($, _, Backbone, hammer, SwitchView, ControlModel) ->
	
	ControllerView = Backbone.View.extend

		# className: 'controller'

		el: '#view'

		# events:
		# 	'window.resize':'calcControlSize'

		log: (words) ->
			console.log words

		currentpane: 0

		offset: 0

		panes: 0

		fullscreen: false

		initialize: ->

			console.log 'new controller view!'

			# Show the loading screen
			console.log @model
			# Register the loaded callback
			@listenTo @model, 'controller:load', @doLayout
			# Fetch the data from the model
			# @model.fetchData()
			
			# Listen for fullscreen mode
			# @listenTo @model.@collection, 'fullscreen:on', @fullscreenOn

			# Recalculate control sizes on window resize
			$(window).on 'resize', =>
				@calcControlSize()

			# Check if running on an iPhone. If so, make room for the status bar
			if navigator.standalone
				@iospadding()

			# @render()

		render: ->

			@thisPane = 0

			# Clear everything

			# Create the first pane
			@$el.append '<div class="pane"></div>'
			@panes += 1

			# Create views for each of the controls
			@model.collection.each (elem,idx) =>

				# Grab the view prototype from the control
				ViewProto = elem.get('viewProto')

				# Construct the view
				controlView = elem.view = new ViewProto
					model: elem
					controllerView: @

				# Push the pane onto the view
				@$el.find('.pane').last().append controlView.render()

				# Set the size of the control view
				controlView.setSize()

				# Increment the pane counter
				@thisPane += 1

				# Check if a new pane is needed
				@checkPane()

			# Register listeners for navigation
			@registerEvents()

		calcControlSize: ->
			@model.collection.each (elem,idx) =>
				elem.view.setSize()

		checkPane: ->
			# Make a new pane if the max is hit
			@log @thisPane
			if @thisPane == 4
				# Make a new pane
				@$el.append '<div class="pane"></div>'
				# Position
				pos = 100*@panes+'%'
				@$el.find('.pane').last().css 
					left: pos
				# Increment the number of panes
				@panes += 1
				# Reset the pane count
				@thisPane = 0



		doLayout: ->
			panes =  Math.ceil @model.collection.length / 4
			@log panes

			# Do any layout stuff here. Get the width of the window, etc

			# Call render to add views to the DOM
			@render()

			# Set the page width
		
		scroll: ->
			@$el.find('.pane').animate
				left: '-=100%'
			,200

		registerEvents: ->

			# console.error @currentpane += 1

			# Swipe left
			# hammertime = hammer(@el).on 'swipeleft', (e) =>
			# 	@scroll()

			# On drag start, store the current position of the panes
			# hammer(@el).on 'dragstart', (e) =>
			# 	@log @offset


			# Drag movement (not a swipe)
			hammer(@el).on 'drag', (e) =>
				@log @fullscreen
				if not @fullscreen
					# Set the left margin (controlls scroll here)
					@$el.find('.pane').css
						'margin-left': -@offset + e.gesture.deltaX
			
			# Drag end
			hammer(@el).on 'dragend', (e) =>
				if not @fullscreen
					@log e.gesture.deltaX
					# If they dragged more than half, go to the next pane (if there is one)
					if Math.abs(e.gesture.deltaX/window.outerWidth) > 0.5
						# More than half - which direction to go?
						if e.gesture.deltaX > 0
							@lastPane()
						else
							@nextPane()

					else
						console.log 'Dont go anywhere'
						# Animate back to the same pane
						@goToPane()

			# # Swipe right
			# hammer(@el).on 'swiperight', (e) =>
			# 	if not @fullscreen
			# 		# Go to the last pane
			# 		@lastPane()

			# # Swipe left
			# hammer(@el).on 'swipeleft', (e) =>
			# 	if not @fullscreen
			# 		# Go to the next pane
			# 		@nextPane()

		nextPane: ->
			# Allowed?
			if @currentpane < @panes - 1
				# Next pane
				@currentpane += 1
				@offset = @currentpane * window.outerWidth
			# Animate
			@goToPane()

		lastPane: ->
			# Allowed?
			if @currentpane > 0
				# Previous pane
				@currentpane -= 1
				@offset = @currentpane * window.outerWidth
			# Animate
			@goToPane()


		goToPane: ->
			# Animate to the current pane
			# @log @
			@log -@currentpane * window.outerWidth
			@log @$el.find('.pane')
			@$el.find('.pane').animate
				'margin-left': -@currentpane * window.outerWidth
			, 200

			# Set the offset
			# @offset = @currentpane * window.outerWidth

		pickSizes: ->
			width = window.outerWidth
			height = window.outerHeight
			console.log [width,height]


			# if width < 450
			# 	@controldims = 
			# 		width: width / 2
			# 		height: width / 2
			# 		# icon: width / 8
			# 		# text: width / 20
			# else if width < 738
			# 	@controldims = 
			# 		width: width / 2
			# 		height: width / 2
			# 		# icon: width / 8
			# 		# text: width / 30
			# else
			# 	@controldims = 
			# 		width: width / 2
			# 		height: width / 2
			# 		# icon: 50
			# 		# text: 20

			# @controldims.icon = @controldims.width / 3
			# @controldims.text = @controldims.width / 12

			# @controldims.width = $('.control').width()
			# @controldims.height = $('.control').height()

			# @render()

		iospadding: ->
			$('#view').css
				top: 16
				height: $('#view').height() - 16
	
	
	return ControllerView