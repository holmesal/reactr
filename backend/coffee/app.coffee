express = require 'express.io'
app = express().http().io()

mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/reactr'

# Set up the sessions
# app.use(express.cookieParser())
# app.use(express.session({secret:'monkey'}))


# Set up the controller routes
controller = require './routes/controller'

# Allow cross-origin requests
# app.all '/', (req,res,next) ->
# 	res.header "Access-Control-Allow-Origin", "*"
# 	res.header "Access-Control-Allow-Headers", "X-Requested-With"
# 	next()

# app.get '/', (req,res) ->
# 	req.session.loginDate = new Date().toString()

# Login and logout routes
app.post '/login', (req,res) ->
	req.session.loggedin = true
	res.end
		id: 1234

app.post '/logout', (req,res) ->
	req.session.loggedin = false
	res.end 'logged out'


# Controller routes
app.io.route 'controller',
	
	create: (req) ->
		# console.log req.session
		# if req.session.num >= 0
		# 	req.session.num += 1
		# else
		# 	req.session.num = 0
		console.log 'create a new controller'
		# req.session.save ->
		# 	req.io.respond
		# 		err: req.session
		# controller.create(req)

	read: (req) ->
		console.log 'read an existing controller'
		controller.read req
		# console.log req.data
		# req.io.respond 'pahaha'

	update: (req) ->
		console.log 'update an existing controller'
		console.log req.data

	delete: (req) ->
		console.log 'delete an existing controller'
		console.log req.data

port = 7076
app.listen port
console.log 'listening on '+port