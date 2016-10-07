# Polymer Snippets for Atom

![banner](http://s12.postimg.org/opgzpvtpp/banner.png)

## Install
Go to `atom > Preferences...` then search for Polymer Snippets in the `Install` tab.

*Note: Restarting Atom might be required for the snippets to show in the auto-complete menu.*

## Compatibility with Emmet
If you have [Emmet](https://github.com/emmetio/emmet-atom) installed it will clobber the tab completion for HTML snippets. You can follow [this workaround](https://github.com/emmetio/emmet-atom/issues/225#issuecomment-82669798) to get Polymer snippets working again.

## Elements

Type the name of [any `iron-*` or `paper-*` element](https://elements.polymer-project.org/), then hit `tab` to auto complete. Ex:

![snippet1](https://cloud.githubusercontent.com/assets/1066253/8414154/cfcc68ba-1e4a-11e5-9363-e8a92f524ed3.gif)

## Polymer

### [pe] polymer element

```html
<dom-module id="${1}">
  <template>
    <style>
      :host {
        display: block;
      }
    </style>
    $2
  </template>
  <script>
    Polymer({
      is: '$1'
    });
  </script>
</dom-module>
```

### [pe2015] polymer element ES2015

```html
<dom-module id="${2}">
  <template>
    <style>
      :host {
        display: block;
      }
    </style>

  </template>
  <script>
    (function (Polymer) {
      'use strict';
      class ${1} {
        beforeRegister() {
          this.is = '${2}';

          this.properties = {
            ${3}
          };
        }

        attached() {
        }
      }

      Polymer(${1});
    })(Polymer);
  </script>
</dom-module>
```

### [pes] polymer element with external stylesheet

```html
<dom-module id="$1">
  <link rel="import" type="css" href="$1.css">
  <template>
    $2
  </template>
  <script>
    Polymer({
      is: '$1'
    });
  </script>
</dom-module>
```

### [pb] polymer behavior

```javascript
$2Behavior = {
  properties: {
    $3
  }
};
```

### [pbi] polymer behavior implement

```javascript
$2BehaviorImpl = {
  properties: {
    $3
  }
};

$2Behavior = [$2BehaviorImpl];
```

### [pcst] Polymer custom-style template
```html
<dom-module id="${1:shared-styles}">
  <template>
    <style>
      $0
    </style>
  </template>
</dom-module>
```

### [pcs] Polymer custom-style template
```html
<style ${1:is="custom-style"} include="${0:shared-styles}"></style>
```

### [arrsel] Array selector

```html
<array-selector id="${1:selector}"
    	items="{{${2:array}}}" selected="{{${3:selected}}}"
    	${4:multi} ${5:toggle}>
</array-selector>
```

### [dom-if] Template dom-if

```html
<template is="dom-if" if="$1"${2: restamp="true"}>$0</template>
```

### [dom-repeat] Template dom-repeat

```html
<template is="dom-repeat" items="$1"${2: index-as="index"}>$0</template>
```

### [domb] Template dom-bind

```html
<template is="dom-bind">
  $0
</template>
```

### [webcomponents] web components polyfill

```html
<script src="${0:bower_components}/webcomponentsjs/webcomponents-lite.js"></script>
```

### [wcs] load web components polyfill when not supported

```javascript
// Load Web Components when not supported
var webComponentsSupported = ('registerElement' in document
    && 'import' in document.createElement('link')
    && 'content' in document.createElement('template'));

if (!webComponentsSupported) {
  var script = document.createElement('script');
  script.src = '${0:bower_components}/webcomponentsjs/webcomponents-lite.js';
  document.head.appendChild(script);
}
```

### [hi] html import

```html
<link rel="import" href="${1:bower_components}/${0}/${0}.html">
```

### [hii] html import iron-* element

```html
<link rel="import" href="${1:bower_components}/iron-${2}/iron-${2}.html">
```

### [hip] html import paper-* element

```html
<link rel="import" href="{1:bower_components}/paper-$2/paper-$2.html">
```
### [hia] html import app-* element

```html
<link rel="import" href="{1:bower_components}/app-$2/app-$2.html">
```

## Web Components

### [template] template
```html
<template$1>$0</template>
```

### [ce] custom element

```javascript
var ${4:tmpl} = document.querySelector('${5:template}');

var ${1:WidgetProto} = Object.create(HTMLElement.prototype);

${1:WidgetProto}.createdCallback = function() {
  var root = this.createShadowRoot();
  root.appendChild(document.importNode(${4:tmpl}.content, true));
};

var ${2:Widget} = document.registerElement('${3:my-widget}', {
  prototype: ${1:WidgetProto}
});
```

## HTML

### [ph] HTML template with Web Components polyfill

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <title>${1}</title>
  <meta name="description" content="${2}">

  <!-- Mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

  <!-- Chrome / Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="theme-color" content="black">
  <link rel="icon" href="icon.png">

  <!-- Safari / iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <link rel="apple-touch-icon-precomposed" href="apple-touch-icon.png">

  <!-- Web Components -->
  <script src="bower_components/webcomponentsjs/webcomponents-lite.js"></script>
</head>
<body unresolved>
  $0
</body>
</html>
```

### [phs] HTML template with Web Components polyfill load when not supported by browser

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <title>${1}</title>
  <meta name="description" content="${2}">

  <!-- Mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

  <!-- Chrome / Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="theme-color" content="black">
  <link rel="icon" href="icon.png">

  <!-- Safari / iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <link rel="apple-touch-icon-precomposed" href="apple-touch-icon.png">

  <!-- Check if Web Components are supported-->
  <script>
    var webComponentsSupported = ('registerElement' in document
        && 'import' in document.createElement('link')
        && 'content' in document.createElement('template'));

    if (!webComponentsSupported) {
      var script = document.createElement('script');
      script.src = 'bower_components/webcomponentsjs/webcomponents-lite.js';
      document.head.appendChild(script);
    }
  </script>
</head>
<body unresolved>
  $0
</body>
</html>
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

[MIT License](http://robdodson.mit-license.org/) © Rob Dodson
