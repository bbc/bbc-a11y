var commandLineArgs = {
  parse: function(argv) {
    var args = { interactiveMode: false }
    if (argv.indexOf('--interactive') > -1) {
      args.interactiveMode = true
    }
    return args
  }
}

module.exports = commandLineArgs
