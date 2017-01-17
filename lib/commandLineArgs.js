var commandLineArgs = {
  parse: function(argv) {
    var args = { interactiveMode: false, urls: argv }
    if (argv.indexOf('--interactive') > -1) {
      args.interactiveMode = true
      args.urls = args.urls.filter(function(arg) { return arg != '--interactive' })
    }
    return args
  }
}

module.exports = commandLineArgs
