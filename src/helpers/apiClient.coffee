# creates api
superagent = require("superagent")
Q = require("q")

try
	log = appLogger.child({
		type: "helpers"
		file: "apiClient"
	})
catch
	log = console
	log.info = console.log

# data functions
segmentUrl = (type, segment)->
	if __SERVER__
		url = "http://" + apiHost + ":" + apiPort + "/" + type + "/" + segment
	if __CLIENT__
		url = "/api/" + type + "/" + segment
	return url

get = (segment)->
	def = Q.defer()
	url = segmentUrl("get", segment)
	log.info url:url, "client url"
	request = superagent.get(url)
	.set("Accept", "application/json")
	.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(JSON.parse res.text)
	return def.promise

post = (segment, data)->
	def = Q.defer()
	url = segmentUrl("post", segment)
	request = superagent.post(url)
	.send(data)
	.set("Accept", "application/json")
	.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(res)
	return def.promise


auth = (req)->
	def = Q.defer()
	url = segmentUrl("admin-auth", "auth")
	console.log url
	request = superagent.get(url)
	request.set("Accept", "application/json")

	if __SERVER__ && req.get("cookie")
		request.set("cookie", req.get("cookie"))
	# .send(data)
	request.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(JSON.parse res.text)
	return def.promise

class Client
	constructor: (req)->
		@get = (segment)->
			def = Q.defer()
			url = segmentUrl("get", segment)
			request = superagent.get(url)
			.set("Accept", "application/json")
			if __SERVER__ && req.get("cookie")
				request.set("cookie", req.get("cookie"))
			request.end (err, body)->
				if err then return def.reject(err)
				return def.resolve JSON.parse(body.text)
			return def.promise
		@post = (segment, data)->
			def = Q.defer()
			url = segmentUrl("post", segment)
			request = superagent.get(url)
			.send(data)
			.set("Accept", "application/json")
			if __SERVER__ && req.get("cookie")
				request.set("cookie", req.get("cookie"))
			request.end (err, body)->
				if err then return def.reject(err)
				return def.resolve JSON.parse(body.text)
			return def.promise
		@auth = ()->
			def = Q.defer()
			url = segmentUrl("admin-auth", "auth")
			request = superagent.get(url)
			.set("Accept", "application/json")
			if __SERVER__ && req.get("cookie")
				request.set("cookie", req.get("cookie"))
			request.end (err, body)->
				if err then return def.reject(err)
				return def.resolve JSON.parse(body.text)
			return def.promise

module.exports = Client
