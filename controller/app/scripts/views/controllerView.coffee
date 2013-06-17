
# Controller View
# ============
# Responsible for building the visual aspects of the controller


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

		events:
			'click':'scroll'

		log: (words) ->
			console.log words

		currentpane: 0

		initialize: ->

			console.log 'new controller view!'

			# Show the loading screen
			console.log @model
			# Register the loaded callback
			@listenTo @model, 'controller:load', @doLayout
			# Fetch the data from the model
			# @model.fetchData()

			# @render()

		render: ->

			@thisPane = 0
			@panes = 0

			# Clear everything

			# Create the first pane
			@$el.append '<div class="pane"></div>'
			@panes += 1

			# Create views for each of the controls
			@model.collection.each (elem,idx) =>

				# Grab the view prototype from the control
				ViewProto = elem.get('viewProto')

				# Construct the view
				controlView = new ViewProto
					model: elem

				# Push the pane onto the view
				@$el.find('.pane').last().append controlView.render()

				# Increment the pane counter
				@thisPane += 1

				# Check if a new pane is needed
				@checkPane()

			# Register listeners for navigation
			@registerEvents()

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

			console.error @currentpane += 1

			# Swipe left
			# hammertime = hammer(@el).on 'swipeleft', (e) =>
			# 	@scroll()

			# Drag
			hammertime = hammer(@el).on 'drag', (e) =>
				@log e
				@log e.gesture.deltaX / window.outerWidth
				@hold = -e.gesture.deltaX / window.outerWidth
				@log @hold
				@log @$el.find('.pane').last().offset()
				# @$el.find('.pane').animate
				# 	left: '-=100%'
				# ,200

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
	
	
	return ControllerView