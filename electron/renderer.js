const path = require('path')
const electron = require('electron')

const Runner = require('../lib/runner')
const Reporter = require('../lib/reporter')
const ElectronWindowAdapter = require('./windowAdapter')
const CommandLineArgs = require('../lib/cli/args')

const remoteConsole = electron.remote.getGlobal('console')

const argv = electron.remote.process.argv
const args = CommandLineArgs.parse(argv)

const reporter = Reporter.createReporter({ name: args.reporter, console, remoteConsole })

const summariseTests = !!args.summary

const exit = args.interactive ? () => {} : electron.remote.process.exit

const configPath = path.resolve(args.configPath || path.join(process.cwd(), 'a11y.js'))

const pages = args.urls.map(url => ({ url, width: args.width }))

const windowAdapter = new ElectronWindowAdapter()

const runManualTests = args.manual

new Runner({ configPath, pages, windowAdapter, runManualTests, reporter, summariseTests, exit }).run()
