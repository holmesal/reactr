Models = require __dirname + '/../models/controller.js'

console.log __dirname

create = (req) ->
	
	# Populate the controller
	controller = new Models.Controller
		name: req.data.name
		controls: req.data.controls

	# Save the controller
	controller.save (err) ->
		if not err
			console.log 'saved!'
			console.log req.data
			req.io.respond
				success: 'hooray!'
		else
			console.log 'not saved!'
			req.io.respond
				err: err

	# Respond with the id

	# console.log controller

read = (req) ->
	console.log req.data.name
	# Go look for the control in the database

	Models.Controller.findOne
		name: req.data.name
	, (err,controller) ->
		if controller
			req.io.respond controller

		else

			if not controller
				err = 'No controllers found!'

			req.io.respond
				err: err

			
		# if err
		# 	console.log 'error finding!'
		# 	req.io.respond
		# 		err: err
		# else if not controller
		# 	err = 'nothing found!'
		# 	req.io.respond
		# 		err: err
		# else
		# console.log err
		# console.log controller

		# req.io.respond
		# 	# err: 'something bad happened'
		# 	age: 30
		# 	food: 'pizza'


module.exports =
	create: create
	read: read