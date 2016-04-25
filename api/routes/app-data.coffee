express = require("express")
Q = require("q")

try
	log = appLogger.child({
		type: "routes"
		file: "app-data"
	})
catch
	log = console
	log.info = console.log

go = (mongoose)->
	app = express.Router()
	Products = mongoose.model("Product")
	Portfolio = mongoose.model("Portfolio")
	About = mongoose.model("About")
	Stack = mongoose.model("Stack")

	models = [
		{
			name: "products"
			schema: Products
		}
		{
			name: "portfolio"
			schema: Portfolio
		}
		{
			name: "about"
			schema: About
		}
		{
			name: "stack"
			schema: Stack
		}

	]

	_createGetApi = ({schema, name}, _app)->
		url = "/" + name
		_app.get(url, (req, res)->
			schema.find({}).exec()
			.then(
				(docs)->
					res.json(docs)
				(err)->
					log.error err:err, "api error"
					res.status(500).end()
				)
			)
	models.map (x)->
		return _createGetApi(x, app)

	# app.get("/products", (req, res)->
	# 	Products.find({}).exec()
	# 	.then(
	# 		(docs)->
	# 			res.send(docs).end()
	# 		(err)->
	# 			log.error err:err, "error retrieving products"
	# 			res.status(500).end()
	# 		)
	# 	)

	return app

module.exports = go