var commander = require('commander')
var version = require('../../package.json').version

module.exports = {
  parse: function (argv) {
    var opts = commander
      .version(version)
      .arguments('<urls>')
      .option('-i, --interactive', 'show browser window and leave open for debugging')
      .option('-m, --manual', 'include manual tests')
      .option('-w, --width <pixels>', 'override viewport width', parseInt)
      .option('-c, --config <config>', 'path to config file')
      .option('-r, --reporter <reporter>', 'json or [path to custom reporter module]')
      .option('-s, --summary', 'lists all tests with a description of each test')
      .parse(argv)

    return {
      interactive: !!opts.interactive,
      manual: !!opts.manual,
      urls: opts.args,
      width: opts.width,
      configPath: opts.config,
      reporter: opts.reporter,
      summary: opts.summary
    }
  }
}
