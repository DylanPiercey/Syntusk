var tusk = require('tusk');
var hljs = require('highlight.js/lib/highlight.js');
hljs.registerLanguage(__language__, __parser__);

module.exports = function (component) {
    var text = component.children[0];
    return tusk.createElement('pre', {
            class: 'hljs ' + __language__
        },
        tusk.createElement('code', {
            class:     'hljs ' + __language__,
            innerHTML: hljs.highlight(__language__, text, true).value
        })
    );
};
