var commander = require('commander')
var version = require('../package.json').version

var commandLineArgs = {
  parse: function(argv) {
    var opts = commander
      .version(version)
      .option('--interactive', 'Interactive Mode')
      .option('-w, --width <n>', 'Viewport Width', parseInt)
      .parse(argv)

    return {
      interactive: !!opts.interactive,
      urls: opts.args,
      width: opts.width
    }
  }
}

module.exports = commandLineArgs
