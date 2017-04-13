var builder = require('junit-report-builder')
var reportFileName = 'test-report.xml'

function JUnitReport(devToolsConsole, commandLineConsole) {
  this.devToolsConsole = devToolsConsole
  this.commandLineConsole = commandLineConsole
}

JUnitReport.prototype.runStarted = function() {
}

JUnitReport.prototype.pageChecked = function(page, validationResult) {
  var suite = builder.testSuite().name('bbc-a11y')

  validationResult.results.forEach(function(standardResult) {
    var standard = standardResult.standard
    var testName = standard.section.title + ': ' + standard.name
    var docsUrl = standard.section.documentationUrl
    var testcase = suite.testCase().className(page.url).name(testName + ' -- ' + docsUrl)
    standardResult.errors.forEach(function (error) {
      testcase.failure(error.map(function(part) { return part.xpath ? part.xpath : part.toString() } ).join(' '))
    })
  })
}

JUnitReport.prototype.pagePassed = function(page, validationResult) {}

JUnitReport.prototype.pageFailed = function(page, validationResult) {}

JUnitReport.prototype.runEnded = function() {
  this.log(builder.build())
}

JUnitReport.prototype.unexpectedError = function(error) {
  this.log('Error running tests: ' + error.stack)
}

JUnitReport.prototype.configMissing = function(error) {
  this.log('Error running tests: Missing configuration file')
}

JUnitReport.prototype.configError = function(error) {
  this.log('Error running tests: ' + error.stack)
}

JUnitReport.prototype.log = function(message) {
  this.commandLineConsole.log(message)
}

module.exports = JUnitReport
