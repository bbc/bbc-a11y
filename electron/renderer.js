var Runner = require('../lib/bbc/a11y/js/runner')
var Reporter = require('../lib/bbc/a11y/js/reporter')
var jquery = require('jquery')

var electron = require('electron')
var remoteConsole = electron.remote.getGlobal('console')

var argv = JSON.parse(decodeURIComponent(window.location.hash.substr(1)))

function loadUrl(url) {
  return new Promise(function(resolve, reject) {
    var mainFrame = document.getElementById('mainFrame')
    var addressBar = document.getElementById('addressBar')

    mainFrame.onload = function() {
      console.clear()
      console.log("BBC a11y is validating...")
      resolve(jquery(mainFrame).contents())
    }

    addressBar.onkeydown = function(e) {
      if (e.keyCode == 13) {
        console.clear()
        mainFrame.src = addressBar.value
      }
    }

    mainFrame.src = url
  })
}

new Runner().run(argv, loadUrl, new Reporter(console, remoteConsole), electron.remote.process.exit)
