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

  var mainFrame = document.getElementById('mainFrame')
  var addressBar = document.getElementById('addressBar')

  var promise = Promise.resolve()

  if (page.visit) {
    promise = promise.then(function() {
      return page.visit(mainFrame)
    })
  }

  return promise.then(function() {
    return new Promise(function(resolve, reject) {
      function validateFrame() {
        console.clear()
        console.log("BBC a11y is validating...")
        resolve(jquery(mainFrame).contents())
      }

      function loadUrl() {
        if (page.visit) {
          validateFrame()
        } else {
          mainFrame.onload = function() {
            validateFrame()
          }
          mainFrame.src = page.url
        }
      }

      if (isResized) {
        function waitForResize() {
          setTimeout(function() {
            if (window.innerWidth == newWidth) {
              loadUrl()
            } else {
              waitForResize()
            }
          }, 10)
        }
        waitForResize()
      } else {
        loadUrl()
      }
    });
  })

}

const pages = commandLineArgs.urls.map(url => ({ url, width: commandLineArgs.width }))

const configPath = path.resolve(commandLineArgs.configPath || path.join(process.cwd(), 'a11y.js'))

new Runner(configPath)
  .run(pages, loadPage, new Reporter(console, remoteConsole), exit)
