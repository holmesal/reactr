
# Controller Model
# ============
# Responsible for loading the controller from the server, handling interactions, and pushing data back to the server


define [

	'jquery'
	'underscore'
	'backbone'
	'play/models/controlModel'
	'play/collections/controls'

	'play/views/controls/switch'
	'play/views/controls/button'

], ($, _, Backbone, ControlModel, ControlsCollection, SwitchView, ButtonView) ->
	
	ControllerModel = Backbone.Model.extend

		initialize: ->
			console.log 'new controller model!'
			# Fetch data from the server

		fetchData: ->

			# Hardcoded for now
			swit = new ControlModel
				viewProto: SwitchView
				value: 0
				icon: 'icon-magnet'
				name: 'my-switch'
				'name-display': 'My Switch'

			butt = new ControlModel
				viewProto: ButtonView
				type: 'button'
				icon: 'icon-arrow-up'
				name: 'my-button'
				'name-display': 'My Button'

			@collection = new ControlsCollection [swit,butt]

			# Trigger fetch complete event
			@trigger 'controller:load'

	
	
	return ControllerModel