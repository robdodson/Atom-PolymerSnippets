# Polymer Snippets for Atom

![banner](http://s12.postimg.org/opgzpvtpp/banner.png)

## Install
Go to `atom > Preferences...` then search for Polymer Snippets in the `Install` tab.

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

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

[MIT License](http://robdodson.mit-license.org/) © Rob Dodson
