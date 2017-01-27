var commander = require('commander')
var version = require('../package.json').version

var commandLineArgs = {
  parse: function(argv) {
    var opts = commander
      .version(version)
      .option('--interactive', 'Interactive mode')
      .option('--width <n>', 'Viewport width', parseInt)
      .option('--config <config>', 'Path to config file')
      .option('--reporter <reporter>', 'Path to reporter module')
      .parse(argv)

    return {
      interactive: !!opts.interactive,
      urls: opts.args,
      width: opts.width,
      configPath: opts.config,
      reporter: opts.reporter
    }
  }
}

module.exports = commandLineArgs
