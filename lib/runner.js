require('./a11y')

var Standards = require('./standards')
var configLoader = require('./configLoader')

function Runner(configPath) {
  this.configPath = configPath
}

function run(config, loadPage, reporter, exit) {
  var pages = config.pages
  var exitCode = 0
  reporter.runStarted()
  function checkNextPage() {
    var page = pages.shift()
    return loadPage(page)
      .then(function(elementScope) {
        return new Promise(function(resolve, reject) {
          try {
            function find(selector) { return elementScope.find(selector) }
            var validationResult = a11y.validate(page, find)
            var valid = !validationResult.results.find(function(r) { return r.errors.length > 0; } )
            reporter.pageChecked(page, validationResult)
            if (valid) {
              reporter.pagePassed(page, validationResult)
            } else {
              reporter.pageFailed(page, validationResult)
              exitCode = 1
            }
            resolve(exitCode)
          } catch (e) {
            reporter.unexpectedError(e)
            reject(e)
          }
        })
      })
      .then(function(code) {
        if (pages.length > 0) {
          return checkNextPage()
        }
        return code
      })
  }

  return checkNextPage().then(function(code) {
    reporter.runEnded()
    return code
  }).then(exit)
}

Runner.prototype.run = function(pages, loadUrl, reporter, exit) {
  return this.configForPages(pages)
    .catch(function(error) {
      if (error.code == 'MODULE_NOT_FOUND')
        reporter.configMissing()
      else
        reporter.configError(error)
      exit(2)
    })
    .then(function(config) {
      return run(config, loadUrl, reporter, exit)
    })
}

Runner.prototype.configForPages = function(pages) {
  if (pages.length == 0) {
    return configLoader.load(this.configPath)
  } else {
    return Promise.resolve({ pages })
  }
}

module.exports = Runner
