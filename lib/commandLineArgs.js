var commander = require('commander')

var commandLineArgs = {
  parse: function(argv) {
    var opts = commander.option('--interactive', 'Interactive Mode').parse(argv)
    return {
      interactive: !!opts.interactive,
      urls: opts.args
    }
  }
}

module.exports = commandLineArgs
