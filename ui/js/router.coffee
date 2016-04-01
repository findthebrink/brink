_ = require("lodash")
$ = require("jquery")
Backbone = require("backbone")

# Helpers
# -----------------------
_dispatch = (page, sub)->
	x = {
		action: "render_content"
		page: page
		sub: sub || null
	}
	return app.flux.dispatch(x)


# Router Export
# ----------------------------------------------
router = Backbone.Router.extend({
	initialize: ->
		if !Backbone.History.started
			Backbone.history.start({
				pushState: true
				root: "/"
				})
		@listeners()
	listeners: ->
		targets = $(".app-nav")
		targets.off("click")
		targets.click (e)->
			e.preventDefault()
			t = $(e.currentTarget).attr("href")
			n = t.substring(1, t.length)
			app.router.navigate n, {trigger: true}
	hrefNavigator: (href)->
		l = document.createElement("a")
		l.href = href
		n = l.pathname.substring(1, l.pathname.length)
		app.router.navigate(n, {trigger: true})
	routes:
		""										: 	"home"
		"products-and-services/:sub"			:	"renderProductSub"
		"products-and-services/:sub/:product"	: 	"renderProductLearn"
		"portfolio"								: 	"portfolio"
		"stack"									:	"stack"
		"products-and-services"					:	"products"
		"contact"								:	"contact"
	home: ->
		_dispatch("Home")
	portfolio: ->
		_dispatch("Portfolio")
	stack: ->
		_dispatch("Stack")
	products: ->
		_dispatch("Products", "packages")
	contact: ->
		_dispatch("Contact")
	renderProductSub: (sub)->
		_dispatch("Products", sub)
	renderProductLearn: (sub, product)->
		# console.log sub:sub, product:product
		app.flux.dispatch({
			action: "render_learn"
			category: sub
			product: product
			})
	})

module.exports = router