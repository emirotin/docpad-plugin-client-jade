# Jade Plugin for DocPad for writing client-side templates
Adds support for [Jade](http://jade-lang.com/) as a client-side template language to [DocPad](https://github.com/bevry/docpad).

Convention:  `.js.cjade`


## Install

```
npm install --save docpad-plugin-client-jade
```

## Use

1. add <https://raw.github.com/visionmedia/jade/master/runtime.min.js> to your pages _before_ any client Jade templates
1. add your templates to the pages as scripts, i.e. having the `documents/templates/something.js.cjade`, add it like

    ```
 <script src="/templates/something.js"></script>
    ```

1. use it from you script:

   ```
 var html = JST['something']({contextvar: 'someval'});
   ```
   The 'something' key is obtained from the path file by stripping the `.cjade` extension, then `.js` extension (see below how to configure), and then removing some common directory from the beginning of the path (see below how to configure).

## Configure

Read on Configuration file here: <https://github.com/bevry/docpad/wiki/Configuration>

**Note** that in your config the key must be `"client-jade"` (which is part of the plugin name after 'docpad-plugin-').

Currently the plugin supports the following options:

* `namespace` – string, the namespace functions are attached to, defaults to `JST`
* `prettify` – bool, if the output should be prettified, defaults to `true` in development and `false` in production
* `baseDir` — string, the base directory (relative to the `documents` root) to be stripped from the path when the key is generated, defaults to `templates`
* `stripJsExt` – bool, whether to strip `.js` extension when the key is generated



## License
Licensed under [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2012 Eugene Mirotin