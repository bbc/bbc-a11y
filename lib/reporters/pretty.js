 function PrettyReporter (devToolsConsole, commandLineConsole) {
   this.devToolsConsole = devToolsConsole
   this.commandLineConsole = commandLineConsole
 }

 PrettyReporter.prototype.runStarted = function () {
   this.devToolsConsole.clear()
   this.devToolsConsole.log('BBC a11y is testing the page...')
   this.summary = {
     pagesChecked: 0,
     errorsFound: 0,
     errorsHidden: 0,
     warningsFound: 0,
     standardsSkipped: 0,
     documentationUrls: []
   }
 }

 PrettyReporter.prototype.pageChecked = function (page, pageResult) {
   this.summary.pagesChecked++
   this.summary.standardsSkipped += pageResult.skipped.length
   var summary = this.summary
   pageResult.results.forEach(function (standardResult) {
     summary.errorsHidden += standardResult.hiddenErrors.length
     summary.warningsFound += standardResult.warnings.length
   })

   var hasErrors = pageResult.results.some(r => r.errors.length > 0)
   var statusLine = (hasErrors ? '✗' : '✓') + ' ' + page.url
   if (page.width > 0) { statusLine += ' --width ' + page.width }
   this.devToolsConsole.log(statusLine)
   this.commandLineConsole.log(statusLine)

   for (var i = 0; i < pageResult.results.length; i++) {
     var result = pageResult.results[i]
     this.summary.errorsFound += result.errors.length
     this.printResultMessages(result, 'errors', '*')
     this.printResultMessages(result, 'warnings', '⚠')
   }
   this.commandLineConsole.log('')
 }

 PrettyReporter.prototype.printResultMessages = function (result, list, symbol) {
   if (result[list].length > 0) {
     this.commandLineConsole.log('  ' + symbol + ' ' + result.standard.section.title + ': ' + result.standard.name)
     if (this.summary.documentationUrls.indexOf(result.standard.section.documentationUrl) === -1) {
       this.summary.documentationUrls.push(result.standard.section.documentationUrl)
     }
   }
   for (var k = 0; k < result[list].length; k++) {
     var args = [result.standard.name + '\n'].concat(result[list][k].map(function (a) {
       return a.element ? a.element : a
     }))
     this.devToolsConsole.warn.apply(this.devToolsConsole, args)
     var commandLineConsoleArgs = ['    -'].concat(result[list][k].map(function (a) {
       return a.xpath ? a.xpath : a.toString()
     }))
     this.commandLineConsole.log.apply(this.devToolsConsole, commandLineConsoleArgs)
   }
 }

 PrettyReporter.prototype.runEnded = function () {
   if (this.summary.documentationUrls.length > 0) {
     this.commandLineConsole.log('For details on how to fix these errors, please see the following pages:')
     for (var i = 0; i < this.summary.documentationUrls.length; i++) {
       this.commandLineConsole.log('  - ' + this.summary.documentationUrls[i])
     }
   }
   this.commandLineConsole.log(
    pluralise(this.summary.pagesChecked, 'page') + ' checked, ' +
    pluralise(this.summary.errorsFound, 'error') + ' found, ' +
    (this.summary.errorsHidden > 0 ? pluralise(this.summary.errorsHidden, 'error') + ' hidden, ' : '') +
    pluralise(this.summary.warningsFound, 'warning') + ', ' +
    pluralise(this.summary.standardsSkipped, 'standard') + ' skipped'
  )
   this.commandLineConsole.log('')
   if (this.summary.errorsFound === 0) {
     this.commandLineConsole.log(
      'No errors found. But please remember:\n' +
      '\n' +
      '"Testing shows the presence, not the absence of bugs" -- Edsger W. Dijkstra\n' +
      '\n' +
      'I am only a robot. Always make time to perform manual testing using assistive\n' +
      "technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good\n" +
      'user experience.'
    )
   }
 }

 PrettyReporter.prototype.unexpectedError = function (error) {
   this.commandLineConsole.log('Unexpected Error', error.stack)
 }

 PrettyReporter.prototype.configMissing = function () {
   this.commandLineConsole.log('Missing configuration file (a11y.js).')
   this.commandLineConsole.log('')
   this.commandLineConsole.log('Please visit http://github.com/bbc/bbc-a11y for more information.')
 }

 PrettyReporter.prototype.configError = function (error) {
   var m = error.stack.split('\n')[1].match(/\(([^:]+):(\d+)/)
   this.commandLineConsole.log('There was an error reading your configuration file at line ' + m[2] + " of 'a11y.js'")
   this.commandLineConsole.log('')
   this.commandLineConsole.log(error.message)
   this.commandLineConsole.log('')
   this.commandLineConsole.log('For help learning the configuration DSL, please visit https://github.com/bbc/bbc-a11y')
 }

 function pluralise (count, str) {
   return count + ' ' + (count === 1 ? str : str + 's')
 }

 module.exports = PrettyReporter
