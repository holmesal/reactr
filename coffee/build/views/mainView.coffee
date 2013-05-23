
# Main View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'handlebars'
	'text!templates/main.html'
	'build/views/editPaneView'

], ($, _, Backbone, Handlebars, MainTemplate, EditPaneView) ->
	
	MainView = Backbone.View.extend

		el: '#page'

		events:
			'click #get-started':'getStarted'

		template: Handlebars.compile(MainTemplate)

		initialize: ->
			@render()

			# Initialize the edit pane view
			@editPaneView = window.app.views.editPaneView = new EditPaneView

		render: ->
			@$el.html(@template())

		getStarted: ->
			@editPaneView.getStarted()
			
	
	
	return MainView