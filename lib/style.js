var tusk = require('tusk');

module.exports = tusk.createElement('style', {
	innerHTML: __style__
});
