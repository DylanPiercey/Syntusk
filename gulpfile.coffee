fs     = require("fs")
gulp   = require("gulp")
cssmin = require("cssmin")

try fs.mkdirSync("#{__dirname}/style")

jsReg            = /\.js$/
cssReg           = /\.css$/
highlightDir     = "#{__dirname}/node_modules/highlight.js"
languageTemplate = fs.readFileSync("#{__dirname}/lib/language.js", "utf8")
languages        = (file.replace(jsReg, "") for file in fs.readdirSync("#{highlightDir}/lib/languages") when jsReg.test(file))
styles           = (file.replace(cssReg, "") for file in fs.readdirSync("#{highlightDir}/styles") when cssReg.test(file))

gulp.task "build", ->
	for name in styles
		css = JSON.stringify(cssmin(fs.readFileSync("#{highlightDir}/styles/#{name}.css", "utf8")))
		fs.writeFileSync("#{__dirname}/style/#{name}.js", "module.exports = #{css};")

	for name in languages
		fs.writeFileSync("#{__dirname}/#{name}.js",
			languageTemplate
				.replace(/__language__/g, JSON.stringify(name))
				.replace(/__parser__/g, "require(\"highlight.js/lib/languages/#{name}.js\")")
		)
