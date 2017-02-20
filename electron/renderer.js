const Runner = require('../lib/runner')

const jquery = require('jquery')
const path = require('path')

const electron = require('electron')
const remoteConsole = electron.remote.getGlobal('console')

const argv = electron.remote.process.argv
const commandLineArgs = require('../lib/commandLineArgs').parse(argv)

let Reporter
switch (commandLineArgs.reporter) {
  case 'json':
  case 'junit':
    Reporter = require(`../lib/reporters/${commandLineArgs.reporter}`)
    break;
  case undefined:
    Reporter = require('../lib/reporters/pretty')
    break;
  default:
    Reporter = require(path.join(process.cwd(), commandLineArgs.reporter))
}

const exit = commandLineArgs.interactive ?
  () => {} : electron.remote.process.exit

function loadPage(page) {
  const win = electron.remote.getCurrentWindow()
  const [currentWidth, currentHeight] = win.getContentSize()
  const newWidth = page.width || 1024
  const isResized = currentWidth != newWidth
  if (isResized) {
    win.setContentSize(newWidth, currentHeight, false)
  }

  return new Promise(function(resolve, reject) {
    var mainFrame = document.getElementById('mainFrame')
    var addressBar = document.getElementById('addressBar')

    mainFrame.onload = function() {
      console.clear()
      console.log("BBC a11y is validating...")
      resolve(jquery(mainFrame).contents())
    }

    if (isResized) {
      function waitForResize() {
        setTimeout(function() {
          if (window.innerWidth == newWidth) {
            mainFrame.src = page.url
          } else {
            waitForResize()
          }
        }, 10)
      }
      waitForResize()
    } else {
      mainFrame.src = page.url
    }
  })
}

const pages = commandLineArgs.urls.map(url => ({ url, width: commandLineArgs.width }))

const configPath = path.resolve(commandLineArgs.configPath || path.join(process.cwd(), 'a11y.js'))

new Runner(configPath)
  .run(pages, loadPage, new Reporter(console, remoteConsole), exit)
