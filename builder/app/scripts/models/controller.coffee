
# Controller Model
# ============
# 
# Contains the current state of the controller, including all controls and attached values


define [

	'jquery'
	'underscore'
	'backbone'
	'socketio'
	'collections/controller'

], ($, _, Backbone, socketio, ControllerCollection) ->
	
	ControllerModel = Backbone.Model.extend

		url: 'controller'

		defaults:
			name: 'pockettanks'

		initialize: ->
			
			# Go get the controller model from the server
			# Use backbone.sync somehow here
			@fakedata()

			window.socket = @socket = socketio.connect 'http://localhost:7076'

			$.getJSON 'http://localhost:7076',(res)->
				console.log res

			socket.emit 'ready', 'alonso'

			# @save()

			# Register the change, add, and remove events for the connected collection
			# @listenTo @collection,'change',->
			# 	@save()
			@listenTo @collection,'add',@toServer
			@listenTo @collection,'remove',@toServer
			@listenTo @collection,'change',@toServer
			# @listenTo @collection,'remove',->
			# 	@save()

			# Connect via sockets (have to specify port for local, otherwise defaults to 9000)
			@io = socketio.connect 'http://localhost:7076'

			# @io.on 'talk', (data) ->
			# 	console.log data

			# @io.on 'controller:read', (data) ->
			# 	console.log 'controller updated!'
			# 	console.log data


			# @io.emit 'ready',
			# 	message: 'test'
			# 	controller: 'none'

			# Grab the last few logs (property stored on the socket)

		fakedata: ->

			console.log 'put fake data here'
			@collection = new ControllerCollection
			@collection.controller = @

		toServer: ->
			@save null,
				success: ->
					console.log 'Updated model on server!'
				error: (model,response,options) ->
					console.error response

		toJSON: ->
			# Just a copy of the default toJSON behavior
			modelprops = _.clone @attributes
			# Manually add the collection
			_.extend modelprops,
				controls: @collection.toJSON()

	
	
	return ControllerModel