var Runner = require('../lib/runner')
var Reporter = require('../lib/reporter')
var jquery = require('jquery')

var electron = require('electron')
var remoteConsole = electron.remote.getGlobal('console')

const argv = electron.remote.process.argv
const commandLineArgs = require('../lib/commandLineArgs').parse(argv)

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

new Runner().run(pages, loadPage, new Reporter(console, remoteConsole), exit)
