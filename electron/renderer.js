const Runner = require('../lib/runner')

const jquery = require('jquery')
const path = require('path')

const electron = require('electron')
const remoteConsole = electron.remote.getGlobal('console')

const argv = electron.remote.process.argv
const commandLineArgs = require('../lib/commandLineArgs').parse(argv)

const Reporter = require(commandLineArgs.reporter ?
  path.join(process.cwd(), commandLineArgs.reporter) : '../lib/reporter')

const exit = commandLineArgs.interactive ?
  () => {} : electron.remote.process.exit

function loadPage(page) {
  if (page.width) {
    const win = electron.remote.getCurrentWindow()
    const currentHeight = win.getContentSize()[1]
    win.setContentSize(page.width, currentHeight, false)
  }

  return new Promise(function(resolve, reject) {
    var mainFrame = document.getElementById('mainFrame')
    var addressBar = document.getElementById('addressBar')

    mainFrame.onload = function() {
      console.clear()
      console.log("BBC a11y is validating...")
      resolve(jquery(mainFrame).contents())
    }

    mainFrame.src = page.url
  })
}

const pages = commandLineArgs.urls.map(url => ({ url, width: commandLineArgs.width }))

const configPath = path.resolve(commandLineArgs.configPath || path.join(process.cwd(), 'a11y.js'))

new Runner(configPath)
  .run(pages, loadPage, new Reporter(console, remoteConsole), exit)
