fs = require("fs")
gulp = require("gulp")

try fs.mkdirSync("#{__dirname}/style")

jsReg            = /\.js$/
cssReg           = /\.css$/
highlightDir     = "#{__dirname}/node_modules/highlight.js"
languages        = (file.replace(jsReg, "") for file in fs.readdirSync("#{highlightDir}/lib/languages") when jsReg.test(file))
styles           = (file.replace(cssReg, "") for file in fs.readdirSync("#{highlightDir}/styles") when cssReg.test(file))
languageTemplate = fs.readFileSync("#{__dirname}/lib/language.js").toString()
styleTemplate    = fs.readFileSync("#{__dirname}/lib/style.js").toString()

gulp.task "build", ->
	for name in styles
		fs.writeFileSync("#{__dirname}/style/#{name}.js",
			styleTemplate
				.replace(/__style__/g, JSON.stringify(
					fs.readFileSync("#{highlightDir}/styles/#{name}.css").toString()
				)
			)
		)

	for name in languages
		fs.writeFileSync("#{__dirname}/#{name}.js",
			languageTemplate
				.replace(/__language__/g, JSON.stringify(name))
				.replace(/__parser__/g, "require(\"highlight.js/lib/languages/#{name}.js\")")
		)
