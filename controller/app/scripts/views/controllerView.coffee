
# Controller View
# ============
# Responsible for building the visual aspects of the controller


define [

	'jquery'
	'underscore'
	'backbone'
	'views/controls/switch'
	'models/controlModel'

], ($, _, Backbone, SwitchView, ControlModel) ->
	
	ControllerView = Backbone.View.extend

		className: 'controller'

		initialize: ->

			console.log 'new controller view!'

			# Show the loading screen
			console.log @model
			# Register the loaded callback
			@listenTo @model, 'controller:load', @pickSizes
			# Fetch the data from the model
			# @model.fetchData()

			# @render()

		render: ->

			# Create views for each of the controls

			# Append the views to the dom
			@model.collection.each (elem,idx) =>
				# Create a view for the control
				# if elem.get('type') is 'switch'
				# 	controlView = new SwitchView
				# 		model: elem
				# 		controldims: @controldims
				# else if elem.get('type') is 'button'

				# else
				# 	alert 'unrecognized control'
				# 	
				ViewProto = elem.get('viewProto')
				console.log @model.socket

				controlView = new ViewProto
					model: elem
					controldims: @controldims


				@$el.append controlView.render()

			# for controlView in [1..3]
			# 	controlView = new SwitchView
			# 		model: new ControlModel
			# 		controldims: @controldims
			# 	@$el.append controlView.render()

			$('#page').html(@el)

		pickSizes: ->
			# width = window.outerWidth
			# console.log width
			# height = window.outerHeight

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

			@render()
	
	
	return ControllerView