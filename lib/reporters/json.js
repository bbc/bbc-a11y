function JsonReporter (devToolsConsole, commandLineConsole) {
  this.devToolsConsole = devToolsConsole
  this.commandLineConsole = commandLineConsole
}

JsonReporter.prototype.runStarted = function () {
  this.summary = {
    pagesChecked: 0,
    errorsFound: 0,
    errorsHidden: 0,
    standardsSkipped: 0,
    pages: []
  }
}

JsonReporter.prototype.pageChecked = function (page, pageResult) {
  pageResult = pageResult.flatten()
  this.summary.errorsFound += pageResult.errorsFound
  this.summary.pagesChecked++
  this.summary.standardsSkipped += pageResult.skipped.length
  this.summary.pages.push({ url: page.url, result: pageResult })
}

JsonReporter.prototype.runEnded = function () {
  this.log(this.summary)
}

JsonReporter.prototype.unexpectedError = function (error) {
  this.log({ outcome: 'error', error: error.stack })
}

JsonReporter.prototype.configMissing = function () {
  this.log({ outcome: 'error', error: 'Missing configuration file' })
}

JsonReporter.prototype.configError = function (error) {
  this.log({ outcome: 'error', error: error.stack })
}

JsonReporter.prototype.log = function (object) {
  this.commandLineConsole.log(JSON.stringify(object, null, 2))
}

module.exports = JsonReporter
