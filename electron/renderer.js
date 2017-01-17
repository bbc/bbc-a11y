var Runner = require('../lib/runner')
var Reporter = require('../lib/reporter')
var jquery = require('jquery')

var electron = require('electron')
var remoteConsole = electron.remote.getGlobal('console')

const argv = electron.remote.process.argv.slice(2)
const commandLineArgs = require('../lib/commandLineArgs').parse(argv)

const exit = commandLineArgs.interactiveMode ?
  () => {} : electron.remote.process.exit

function loadUrl(url) {
  return new Promise(function(resolve, reject) {
    var mainFrame = document.getElementById('mainFrame')
    var addressBar = document.getElementById('addressBar')

    mainFrame.onload = function() {
      console.clear()
      console.log("BBC a11y is validating...")
      resolve(jquery(mainFrame).contents())
    }

    mainFrame.src = url
  })
}

new Runner().run(commandLineArgs.urls, loadUrl, new Reporter(console, remoteConsole), exit)
