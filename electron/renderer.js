const path = require('path')

const Runner = require('../lib/runner')
const Reporter = require('../lib/reporter')
const ElectronWindowAdapter = require('./windowAdapter')
const CommandLineArgs = require('../lib/cli/args')

const electronRemote = require('electron').remote
const remoteConsole = electronRemote.getGlobal('console')

const argv = electronRemote.process.argv
const args = CommandLineArgs.parse(argv)

const reporter = Reporter.createReporter({ name: args.reporter, console, remoteConsole })

const { coverage } = args

const exit = args.interactive ? () => {} : electronRemote.process.exit

const configPath = path.resolve(args.configPath || path.join(process.cwd(), 'a11y.js'))

const pages = args.urls.map(url => ({ url, width: args.width }))

const windowAdapter = new ElectronWindowAdapter()

const runManualTests = args.manual

new Runner({
  configPath,
  pages,
  windowAdapter,
  runManualTests,
  reporter,
  coverage,
  exit
}).run()
