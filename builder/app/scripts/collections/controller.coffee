
# Controller Collection
# ============
# 
# This guy holds all of the controls. It should also be hooked up to the backend via the sync function.


define [

	'jquery'
	'underscore'
	'backbone'
	'views/control'

], ($, _, Backbone, ControlView) ->
	
	ControllerCollection = Backbone.Collection.extend

		# url: 'controller'

		# rootUrl: 'controller'

		initialize: ->
			console.log 'new controller collection'

			# @url = 'controller'

			@on 'add',@newModel

		newModel: (control) ->
			console.log control
			# Make a new view for this control
			new ControlView
				controller: @controller
				model: control

			# console.log @sync

			# @save
				# url: 'controller'
	
	return ControllerCollection