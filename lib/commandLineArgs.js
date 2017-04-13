var commander = require('commander')
var version = require('../package.json').version

var commandLineArgs = {
  parse: function(argv) {
    var opts = commander
      .version(version)
      .arguments('<urls>')
      .option('-i, --interactive', 'show browser window and leave open for debugging')
      .option('-w, --width <pixels>', 'override viewport width', parseInt)
      .option('-c, --config <config>', 'path to config file')
      .option('-r, --reporter <reporter>', 'json or junit or [path to custom reporter module]')
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
