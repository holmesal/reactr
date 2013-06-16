mongoose = require 'mongoose'

# The control schema
ControlSchema = new mongoose.Schema
	name: 'string'
	icon: 'string'
	type: 'string'


ControllerSchema = new mongoose.Schema
	name: 'string'
	controls: [ControlSchema]

Control = mongoose.model 'Control', ControlSchema

Controller = mongoose.model 'Controller', ControllerSchema

module.exports =
	Control: Control
	Controller: Controller