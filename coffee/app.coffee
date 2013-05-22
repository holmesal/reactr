
# The App!
# ============

# *You know, start the router and stuff...*


# Include some shit
define [

	'jquery',
	'underscore',
	'backbone',
	'router',
	'models/controls/switch'

], ($, _, Backbone, Router, SwitchControl) ->

	initialize = ->
		# Initialize the router
		Router.initialize()

	# Return some other shit
	return {
		initialize: initialize
	}