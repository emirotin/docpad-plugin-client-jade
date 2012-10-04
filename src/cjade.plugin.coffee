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
        console.log file
        # Fetch useful paths
        fullDirPath = file.get('fullDirPath')


        opts.content = '123'

      next()