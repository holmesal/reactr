
# Boilerplate
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'hammer'
	'text!templates/control.html'

], ($, _, Backbone, handlebars, hammer, ControlTemplate) ->
	
	BaseView = Backbone.View.extend

		className: 'control'

		template: handlebars.compile ControlTemplate

		log: (words) ->
			console.log words

		initialize: ->
			console.log hammer
			# @className += @model.get 'type'
			# @log @
			hammertime = hammer(@el).on 'tap', (e) =>
				@grow()
				@onclick() if @onclick

		setSize: ->
			console.log @model
			console.log @options.controldims
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

		grow: ->
			alert 'hey'
			@$el.animate
				top: 0
				bottom: 0;
				left: 0;
				right: 0;

		render: ->
			# Set the control size
			@$el.html @template(@model.toJSON())
			@$el.addClass @model.get 'type'
			@setSize()
			return @$el

	return BaseView