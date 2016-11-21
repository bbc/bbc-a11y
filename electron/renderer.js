require('../lib/bbc/a11y/js/a11y')
var Standards = require('../lib/bbc/a11y/js/standards')

var mainFrame = document.getElementById('mainFrame')
var addressBar = document.getElementById('addressBar')
var remoteConsole = require('electron').remote.getGlobal('console')

console.log("BBC a11y is validating...")

mainFrame.onload = function() {
  console.clear()
  var jquery = require('jquery')
  var iframeContents = jquery('#mainFrame').contents()
  function find(selector) { return iframeContents.find(selector) }
  setTimeout(function() {
    var summary = { pagesChecked: 1, errorsFound: 0, standardsSkipped: 0 }
    var validationResult = a11y.validate({}, find)
    var valid = !validationResult.results.find(function(r) { return r.errors.length > 0; } )
    summary.standardsSkipped = validationResult.skipped.length
    if (valid) {
      remoteConsole.log('✓ ' + mainFrame.src)
    } else {
      remoteConsole.log('✗ ' + mainFrame.src)

      for (var i = 0; i < validationResult.results.length; i++) {
        var result = validationResult.results[i]
        if (result.errors.length > 0) {
          summary.errorsFound += result.errors.length
          remoteConsole.log('  * ' + humanise(result.standard.section) + ': ' + result.standard.name)
        }
        for (var j = 0; j < result.errors.length; j++) {
          var args = [result.standard.name + "\n"].concat(result.errors[j].map(function(a) {
            return a.element ? a.element : a
          }))
          console.error.apply(console, args)
          var remoteArgs = ['    -'].concat(result.errors[j].map(function(a) {
            return a.xpath ? a.xpath : a.toString()
          }))
          remoteConsole.log.apply(remoteConsole, remoteArgs)
        }
      }
      remoteConsole.log('')
    }
    remoteConsole.log(
      pluralise(summary.pagesChecked, 'page') + ' checked, ' +
      pluralise(summary.errorsFound, 'error') + ' found, ' +
      pluralise(summary.standardsSkipped, 'standard') + ' skipped'
    )
    if (summary.errorsFound == 0) {
      remoteConsole.log(
        "No errors found. But please remember:\n" +
        "\n" +
        "\"Testing shows the presence, not the absence of bugs\" -- Edsger W. Dijkstra\n" +
        "\n" +
        "I am only a robot. Always make time to perform manual testing using assistive\n" +
        "technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good\n" +
        "user experience."
      )
    }
    require('electron').remote.process.exit(summary.errorsFound ? 1 : 0)
  }, 1)
}

function pluralise(count, str) {
  return count + ' ' + (count == 1 ? str : str + 's')
}

function humanise(str) {
  return str[0].toUpperCase() + str.substr(1).replace(/[A-Z]/g, function(c) { return ' ' + c })
}

addressBar.onkeydown = function(e) {
  if (e.keyCode == 13) {
    console.clear()
    mainFrame.src = addressBar.value
  }
}

var argv = JSON.parse(decodeURIComponent(window.location.hash.substr(1)))

mainFrame.src = addressBar.value = argv[0]
