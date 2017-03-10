 function PrettyReporter(devToolsConsole, commandLineConsole) {
  this.devToolsConsole = devToolsConsole
  this.commandLineConsole = commandLineConsole
}

PrettyReporter.prototype.runStarted = function() {
  this.summary =  {
    pagesChecked: 0,
    errorsFound: 0,
    errorsHidden: 0,
    standardsSkipped: 0,
    documentationUrls: []
  }
}

PrettyReporter.prototype.pageChecked = function(page, validationResult) {
  this.summary.pagesChecked++
  this.summary.standardsSkipped += validationResult.skipped.length
  var summary = this.summary
  validationResult.results.forEach(function(standardResult) {
    summary.errorsHidden += standardResult.hiddenErrors.length
  })
}

PrettyReporter.prototype.pagePassed = function(page, validationResult) {
  var statusLine = '✓ ' + page.url
  if (page.width > 0) { statusLine += ' --width ' + page.width }
  this.devToolsConsole.log(statusLine)
  this.commandLineConsole.log(statusLine)
}

PrettyReporter.prototype.pageFailed = function(page, validationResult) {
  var statusLine = '✗ ' + page.url
  if (page.width > 0) { statusLine += ' --width ' + page.width }
  this.devToolsConsole.log(statusLine)
  this.commandLineConsole.log(statusLine)

  for (var i = 0; i < validationResult.results.length; i++) {
    var result = validationResult.results[i]
    if (result.errors.length > 0) {
      this.summary.errorsFound += result.errors.length
      this.commandLineConsole.log('  * ' + result.standard.section.title + ': ' + result.standard.name)
      if (this.summary.documentationUrls.indexOf(result.standard.section.documentationUrl) == -1) {
        this.summary.documentationUrls.push(result.standard.section.documentationUrl)
      }
    }
    for (var j = 0; j < result.errors.length; j++) {
      var args = [result.standard.name + "\n"].concat(result.errors[j].map(function(a) {
        return a.element ? a.element : a
      }))
      this.devToolsConsole.error.apply(this.devToolsConsole, args)
      var commandLineConsoleArgs = ['    -'].concat(result.errors[j].map(function(a) {
        return a.xpath ? a.xpath : a.toString()
      }))
      this.commandLineConsole.log.apply(this.devToolsConsole, commandLineConsoleArgs)
    }
  }
  this.commandLineConsole.log('')
}

PrettyReporter.prototype.runEnded = function() {
  if (this.summary.documentationUrls.length > 0) {
    this.commandLineConsole.log('For details on how to fix these errors, please see the following pages:')
    for (var i = 0; i < this.summary.documentationUrls.length; i++) {
      this.commandLineConsole.log("  - " + this.summary.documentationUrls[i])
    }
  }
  this.commandLineConsole.log('')
  this.commandLineConsole.log(
    pluralise(this.summary.pagesChecked, 'page') + ' checked, ' +
    pluralise(this.summary.errorsFound, 'error') + ' found, ' +
    (this.summary.errorsHidden > 0 ? pluralise(this.summary.errorsHidden, 'error') + ' hidden, ' : '') +
    pluralise(this.summary.standardsSkipped, 'standard') + ' skipped'
  )
  this.commandLineConsole.log('')
  if (this.summary.errorsFound == 0) {
    this.commandLineConsole.log(
      "No errors found. But please remember:\n" +
      "\n" +
      "\"Testing shows the presence, not the absence of bugs\" -- Edsger W. Dijkstra\n" +
      "\n" +
      "I am only a robot. Always make time to perform manual testing using assistive\n" +
      "technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good\n" +
      "user experience."
    )
  }
}

PrettyReporter.prototype.unexpectedError = function(error) {
  this.commandLineConsole.log("Unexpected Error", error.stack)
}

PrettyReporter.prototype.configMissing = function(error) {
  this.commandLineConsole.log("Missing configuration file (a11y.js).")
  this.commandLineConsole.log('')
  this.commandLineConsole.log("Please visit http://github.com/bbc/bbc-a11y for more information.")
}

PrettyReporter.prototype.configError = function(error) {
  var m = error.stack.split("\n")[1].match(/\(([^\:]+)\:(\d+)/)
  this.commandLineConsole.log("There was an error reading your configuration file at line " + m[2] + " of 'a11y.js'")
  this.commandLineConsole.log('')
  this.commandLineConsole.log(error.message)
  this.commandLineConsole.log('')
  this.commandLineConsole.log("For help learning the configuration DSL, please visit https://github.com/bbc/bbc-a11y")
}

function pluralise(count, str) {
  return count + ' ' + (count == 1 ? str : str + 's')
}

module.exports = PrettyReporter
