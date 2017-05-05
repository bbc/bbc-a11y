const Runner = require('../lib/runner')

const path = require('path')

const electron = require('electron')
const remoteConsole = electron.remote.getGlobal('console')

const argv = electron.remote.process.argv
const commandLineArgs = require('../lib/commandLineArgs').parse(argv)

const win = electron.remote.getCurrentWindow()

let Reporter
switch (commandLineArgs.reporter) {
  case 'json':
  case 'junit':
    Reporter = require(`../lib/reporters/${commandLineArgs.reporter}`)
    break
  case undefined:
    Reporter = require('../lib/reporters/pretty')
    break
  default:
    Reporter = require(path.join(process.cwd(), commandLineArgs.reporter))
}

const exit = commandLineArgs.interactive
  ? () => {} : electron.remote.process.exit

class ElectronWindowAdapter {
  getContentSize () {
    const [width, height] = win.getContentSize()
    return { width, height }
  }

  setContentSize (width, height) {
    win.setContentSize(width, height, false)
  }

  measureInnerWidth () {
    return window.innerWidth
  }
}

const windowAdapter = new ElectronWindowAdapter()

const pages = commandLineArgs.urls.map(url => ({ url, width: commandLineArgs.width }))

const configPath = path.resolve(commandLineArgs.configPath || path.join(process.cwd(), 'a11y.js'))

new Runner(configPath, commandLineArgs.manual)
  .run(pages, windowAdapter, new Reporter(console, remoteConsole), exit)
