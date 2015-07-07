# Syntusk

Syntax highlighting for TUSK without the bulk.

[![npm](https://img.shields.io/npm/dm/syntusk.svg)](https://www.npmjs.com/package/syntusk)

# Supported Languages
All languages and styles from [highlight.js](https://highlightjs.org).

# Installation

#### Npm
```console
npm install syntusk
```

# Example
```javascript
// Require a style. (Returns a style TUSK element).
var Theme = require('syntux/style/solarized_dark');

// Require the highlighters.
var XML = require('syntux/xml');
var CSS = require('syntux/css');
var JS = require('syntux/javascript');

// To access the underlying hljs simply require("syntusk").
// Use them in a component.
var MyComponent = function () {
    return (
        <div>
            { Theme }
            <XML>
                {'<a href="example.html"> Click me </a>'}
            </XML>
            <CSS>
                {'body { background-color: green }'}
            </CSS>
            <JS>
                {'var x = { y: "hi" };'}
            </JS>
        </div>
    );
});
```

#### Which (when rendered) will output:
![Example](https://raw.githubusercontent.com/DylanPiercey/Syntusk/master/example.png)
