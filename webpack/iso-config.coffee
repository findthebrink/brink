WebpackIsomorphicToolsPlugin = require("webpack-isomorphic-tools/plugin")

module.exports = {
	debug: false
	assets:
		html:
			extensions: ["html"]
		style_modules:
			extensions: ["scss", "sass", "css"]
			filter: (module, regex, options, log)->
				if options.development
					return WebpackIsomorphicToolsPlugin.style_loader_filter(module, regex, options, log)
				else
					return regex.test(module.name)
			path: (module, options, log)->
				if options.development
					return WebpackIsomorphicToolsPlugin.style_loader_path_extractor(module, options, log)
				else
					return module.name
			parser: (module, options, log)->
				if options.development
					return WebpackIsomorphicToolsPlugin.css_modules_loader_parser(module, options, log)
				else
					return module.source
}