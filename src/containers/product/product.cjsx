React = require("react")
_ = require("lodash")
{Link} = require("react-router")
{connect} = require("react-redux")
{asyncConnect} = require("redux-async-connect")
Helmet = require("react-helmet")

ReactCSSTransitionGroup = require("react-addons-css-transition-group")
PageContainer = require("../../components/page/container-page.cjsx")
HorizontalMenu = require("../../components/menu/menu.cjsx").HorizontalMenu
ProductItem = require("./product-item.cjsx")

titleParser = (section)->
	base = "Products and Services"
	switch section
		when undefined then return base
		when "packages" then return "Package Products"
		when "websites" then return "Website Products"
		when "email" then return "Email Products"
		when "graphics" then return "Graphics Services"
		when "apps" then return "App Services"
		else
			return base

k = 0
Products = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./product.sass")
		# animation speed
		# console.log props:@props
		speed = 750
		content = @context.content["Products"]
		products = @props.products.data
		section = @props.params.section
		helmetTitle = titleParser(section)

		_meta = [
			{
				name: "description"
				content: "Here's what we have to offer your business. Scalable, reliable, fast and inexpensive web solutions for your business. Find out more!"
			}
		]

		# if section, then filter out items to match category
		if section
			base = _.filter(products, (x)->
				x.category == section
				)
			# console.log base:base
		else
			base = products
		# else show all items
		try
			items = base.map (x, i)->
				if x.active == false
					return
				<ProductItem {...x} key={k++} />
		catch e
			items = <ProductItem title="no items available" />

		<PageContainer {...content}>
			<Helmet title={helmetTitle} meta={_meta} />
			<HorizontalMenu menu={content.menu} location={@props.location} />
			<ul className={styles["products-list"]}>
				<ReactCSSTransitionGroup 
				transitionName={{
					enter: styles["product-trans-enter"]
					leave: styles["product-trans-leave"]
					appear: styles["product-trans-enter"]
					}}
				transitionAppear={true} 
				transitionAppearTimeout={speed} 
				transitionEnterTimeout={speed} 
				transitionLeave={false}
				transitionLeaveTimeout={speed}>
					{items}
				</ReactCSSTransitionGroup>
			</ul>
		</PageContainer>		
	})

# Redux
# ----------------------------------------

# mapStateToProps = (state)->
# 	return {
# 		products: state.products.items
# 	}

# ProductsFinal = connect(
# 	mapStateToProps
# 	)(Products)

ProductsAsyncFinal = asyncConnect({
	products: (params, {store, get})->		
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.products && state.products.loaded
		if (!isLoaded(getState()))
			return get("products")
	})(Products)

# module.exports = ProductsFinal
module.exports = ProductsAsyncFinal
# module.exports = Products
