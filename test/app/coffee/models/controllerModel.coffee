
# Controller Model
# ============
# Responsible for loading the controller from the server, handling interactions, and pushing data back to the server


define [

	'jquery'
	'underscore'
	'backbone'
	'backboneiobind'
	'socketio'
	'models/controlModel'
	'collections/controls'

], ($, _, Backbone, backboneiobind, io, ControlModel, ControlsCollection) ->
	
	ControllerModel = Backbone.Model.extend

		# socketServer: 'http://localhost:7076'
		# socketServer: '192.168.2.3:7076'
		socketServer: 'http://api.reactr.co:80'

		urlRoot: 'controller'

		pollInterval: 100

		initialize: ->
			console.log 'new controller model!'

			# Set up the socket connection and kick off the loading process
			@socketize()


		fetchData: ->

			@fetch
				success: (model,response,options) =>
					# Make a new collection, and pass in the "controls" attribute
					@collection = new ControlsCollection response.controls,
						model: ControlModel
					# Hack - unset the 'controls' attribute that was automatically
					@unset 'controls'
					
					# Fire off the :load event
					@trigger 'controller:load'
				error: (model,response,options) ->
					console.log @
					console.error response

			# Emit socket events when any model in the collection starts
			# @collection.on 'change', =>
			# 	@checkTime()

			# Trigger fetch complete event
			# @trigger 'controller:load'

		socketize: ->
			# Connect to the socket server
			@socket = io.connect @socketServer

			# Set the socket object on the window, just for kicks
			window.socket = @socket

			console.log 'Socket connected! Host: '+@socketServer
			console.log @socket

			# Get the controller data
			@fetchData()
			

		populateController: (model,response,options) ->
			console.log @collection

		checkTime: ->
			if Date.now() - @lastSent > @pollInterval
				@lastSent = Date.now()
				@emit()
			else
				console.log 'skipping'

		emit: ->
			# Can optimize here - remove all the bullshit parameters being returned along with the data
			data = @collection.toJSON()
			console.log 'sending!'
			# console.log data
			@socket.emit 'data',data

	
	
	return ControllerModel