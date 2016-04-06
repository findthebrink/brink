{Main, pages} = require("../views/_base")
Stack = require("../views/_stack")
Products = pages.Products
Contact = pages.Contact

class ImgCreator
	constructor: (@img, @alt, @description)->
		return this

Home = {
	view: Main
	props:
		header:
			title: "home"
			description: "derp nerp slerp"
}

Portfolio = {
	view: Main
	props:
		header:
			title: "portfolio"
			description: "some of our best work"
}

Stack = {
	view: Stack
	props:
		header:
			title: "stack"
			description: "what we use and why we like to use it"
		list: [
			{
				title: "node.js"
				img:
					src: "http://johanndutoit.net/presentations/2013/02/gdg-capetown-nodejs-workshop-23-feb-2013/images/nodejs_logo.png"
					alt: "node.js logo"
					href: "https://nodejs.org/en/"
				description: "a super cool javascript-based server platform"
			}
			{
				title: "MongoDB"
				img:
					src: "http://s3.amazonaws.com/info-mongodb-com/_com_assets/media/mongodb-logo-rgb.jpeg"
					alt: "MongoDB logo"
					href: "https://www.mongodb.org/"
				description: "a super cool key-value store"
			}
			{
				title: "ReactJS"
				img:
					src: "http://www.programwitherik.com/content/images/2015/12/reactjs.png"
					alt: "ReactJS Logo"
					href: "https://facebook.github.io/react/"
				description: "a high-performance javascript rendering library"
			}
		]
		secondaryList: [
			{
				title: "Sass"
				img:
					src: "http://sass-lang.com/assets/img/logos/logo-b6e1ef6e.svg"
					alt: "ReactJS Logo"
					href: "https://facebook.github.io/react/"
				description: "a high-performance javascript rendering library"
			}
			{
				title: "npm"
				img:
					src: "https://www.npmjs.com/static/images/npm-logo.svg"
					alt: ""
					href: ""
				description: ""
			}
			{
				title: "bower"
				img:
					src: "http://bower.io/img/bower-logo.png"
					alt: ""
					href: ""
				description: ""
			}
			{
				title: "grunt"
				img:
					src: "https://camo.githubusercontent.com/39242419c60a53e1f3cecdeecb2460acce47366f/687474703a2f2f6772756e746a732e636f6d2f696d672f6772756e742d6c6f676f2d6e6f2d776f72646d61726b2e737667"
					alt: "ReactJS Logo"
					href: "https://facebook.github.io/react/"
				description: "a high-performance javascript rendering library"
			}

		]
}

Products = {
	view: Products
	props:
		header:
			title: "products & services"
			description: "what we would like to do for you"
		menu: [
			{
				title: "packages"
				link: "/products-and-services"
			}
			{
				title: "websites"
				link: "/products-and-services/websites"
			}
			{
				title: "email"
				link: "/products-and-services/email"
			}
			{
				title: "graphics"
				link: "/products-and-services/graphics"
			}
			{
				title: "apps"
				link: "/products-and-services/apps"
			}
		]

		packages: [
			{
				title: "startup package"
				description: "everything you need to get your company online."
				category: "packages"
				product: "startup-package"
				includes: ["business cards", "email addresses", "website"]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_brand.svg"
							"brand input"
							"survey")
						new ImgCreator(
							"/icons/brink-icons_brand.svg"
							"brand input"
							"business requirements")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_uptime.svg"
							"brand input"
							"one week")
					]
					result: "a great looking website with
					synchronized branding and emails to boot"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"brand input"
							"website")
						new ImgCreator(
							"/icons/brink-icons_email.svg"
							"brand input"
							"two email accounts")
						new ImgCreator(
							"/icons/brink-icons_business\ cards.svg"
							"brand input"
							"brand design")
					]
					callout: [
						new ImgCreator(
							"/icons/brink-icons_brand.svg")
					]
			}
		]
		websites: [
			{
				title: "basic design"
				description: "want a website? We'll design it, test it and
				get it running on the web within 5 days."
				category: "websites"
				product: "basic"
				includes: ["static website"]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "domains"
				description: "purchase and manage your domain names"
				category: "websites"
				product: "domain"
				includes: ["managed domain", "automatic renewals", "domain hunting"]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
		email: [
			{
				title: "small business email"
				description: "email solutions for your small business. Grow your
				business with a professional email for your contacts."
				category: "email"
				product: "small-business"
				includes: ["two emails", "unlimited aliases", "high-quality interface"]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "personal email"
				description: "personal email solutions. Can't get the email you want
				on Gmail? We've got you covered."
				category: "email"
				product: "personal"
				includes: ["one email", "unlimited aliases"]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
		graphics: [
			{
				title: "iconography"
				description: "custom iconography for your print and web projects"
				category: "graphics"
				product: "iconography"
				includes: ["custom iconography set", "brand syncing"]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "site layouts"
				description: "speed up your website development. We'll create custom
				wireframes based on your business needs and the latest web-standards."
				category: "graphics"
				product: "site-layouts"
				includes: [
					"you-own vectors"
					"up-to-date internet standards"
					"library recommendations"
				]
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
		apps: [
			{
				title: "basic app"
				description: "need more than just a website? Data-driven web applications
				are the future of the internet. We'll get you started."
				category: "apps"
				product: "basic"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "custom component development"
				description: "already have an app but need new features?
				We've got you covered."
				category: "apps"
				product: "custom-component"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
}



Contact = {
	view: Contact
	props:
		header:
			title: "contact"
			description: "how to get in touch with us"
}

module.exports = {
	Home
	Portfolio
	Stack
	Products
	Contact
}