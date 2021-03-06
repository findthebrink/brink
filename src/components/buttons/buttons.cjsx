React = require("react")
{Link} = require("react-router")


LinkButton = React.createClass({
	render: ->
		styles = require("./buttons.sass")
		<a href={@props.href} className={styles[@props.type]}>
			{@props.title}
		</a>
	})

RouterButton = React.createClass({
	render: ->
		styles = require("./buttons.sass")
		<Link to={@props.href} className={styles[@props.type]}>
			{@props.title}
		</Link>
	})

SimpleButton = React.createClass({
	render: ->
		styles = require("./buttons.sass")
		<a className={styles[@props.type]} href={@props.href} onClick={@props.onClick}>
			{@props.title}
		</a>
	})

NavButton = React.createClass({
	render: ->
		styles = require("./buttons.sass")
		<a className={styles.navButton} href={@props.href || "#"}>
			<iron-icon icon="icons:menu" onClick={@props.onClick} />
		</a>
	})

module.exports = {
	LinkButton
	RouterButton
	SimpleButton
	NavButton
}