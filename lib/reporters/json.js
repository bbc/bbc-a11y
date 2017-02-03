function JsonReporter(devToolsConsole, commandLineConsole) {
  this.devToolsConsole = devToolsConsole
  this.commandLineConsole = commandLineConsole
}

JsonReporter.prototype.runStarted = function() {
  this.summary =  {
    pagesChecked: 0,
    errorsFound: 0,
    errorsHidden: 0,
    standardsSkipped: 0,
    pages: []
  }
}

JsonReporter.prototype.pageChecked = function(page, validationResult) {
  this.summary.pagesChecked++
  this.summary.standardsSkipped = validationResult.skipped.length
  var summary = this.summary
  validationResult.results.forEach(function(standardResult) {
    standardResult.errors = standardResult.errors.map(removeElementsFrom)
    standardResult.hiddenErrors = standardResult.hiddenErrors.map(removeElementsFrom)
    summary.errorsHidden += standardResult.hiddenErrors.length
  })
  this.summary.pages.push({ url: page.url, result: validationResult })
}

JsonReporter.prototype.pagePassed = function(page, validationResult) {
}

JsonReporter.prototype.pageFailed = function(page, validationResult) {
  for (var i = 0; i < validationResult.results.length; i++) {
    var result = validationResult.results[i]
    if (result.errors.length > 0) {
      this.summary.errorsFound += result.errors.length
    }
  }
}

JsonReporter.prototype.runEnded = function() {
  this.log(this.summary)
}

JsonReporter.prototype.unexpectedError = function(error) {
  this.log({ outcome: 'error', error: error.stack })
}

JsonReporter.prototype.configMissing = function(error) {
  this.log({ outcome: 'error', error: 'Missing configuration file' })
}

JsonReporter.prototype.configError = function(error) {
  this.log({ outcome: 'error', error: error.stack })
}

JsonReporter.prototype.log = function(object) {
  this.commandLineConsole.log(JSON.stringify(object, null, 2))
}

function removeElementsFrom(error) {
  return error.map(function(part) { delete part.element; return part })
}

module.exports = JsonReporter
