
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

		template: handlebars.compile(ControlTemplate)

		# events:
			# 'click':'click'

		initialize: ->
			console.log hammer
			hammertime = hammer(@el).on 'tap', (e) =>
				@click()

		setSize: ->
			console.log @options.controldims
			# Set the control size
			@$el.css
				width: @options.controldims.width
				height: @options.controldims.height
			# Set the icon size
			@$el.find('.control-icon').css
				'font-size':@options.controldims.icon
				'margin-top':@options.controldims.height/2 - @options.controldims.icon
			# Set the text size
			@$el.find('.control-name').css
				'font-size':@options.controldims.text
				'margin-top':@options.controldims.width/6
				# 'margin-top':@options.controldims.height/2 - @options.controldims.icon

		render: ->
			# Set the control size
			@$el.html @template(@model.toJSON())
			@setSize()
			return @$el

		click: ->
			# Run the specific control's view's onclick event
			@onclick()

	return BaseView