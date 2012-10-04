# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class CJadePlugin extends BasePlugin
    # Plugin name
    name: 'cjade'

    # Plugin config
    # Only on the development environment use expanded, otherwise use compressed
    config:
      namespace: 'JST'
      prettify: false
      baseDir: 'templates'
      stripJsExt: true
      environments:
        development:
          prettify: true

    # Render some content
    render: (opts, next) ->
      # Prepare
      config = @config
      docpad = @docpad
      {inExtension, outExtension, file} = opts

      if inExtension == 'cjade' and outExtension in ['js',null]
        jade = require 'jade'
        # Fetch useful paths
        key = file.get('relativeOutPath')
        if config.stripJsExt and key[-3..] == '.js'
          key = key[..-4]
        if config.baseDir and config.baseDir.length and key[...config.baseDir.length] == config.baseDir
          key = key[config.baseDir.length+1..]

        preamble = """
                   #{config.namespace} = #{config.namespace} || {};
                   #{config.namespace}['#{key}'] = function
                   """
        compiled = '' + jade.compile(opts.content, client: true, filename: file.get('url'), pretty: config.prettify, debug: !config.prettify)

        opts.content = compiled.replace 'function anonymous', preamble

      next()