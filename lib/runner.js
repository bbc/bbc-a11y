var a11y = require('./a11y')
var jquery = require('jquery')

var configLoader = require('./configLoader')

function Runner (configPath, manualMode) {
  this.configPath = configPath
  this.manualMode = manualMode
}

jquery('#answerFrame').contents().find('head').append('<link rel="stylesheet" type="text/css" href="answerFrame.css">')

function askInFrame (question) {
  jquery('#answerFrame').show()
  return new Promise(function (resolve, reject) {
    var answerFrame = jquery('#answerFrame').contents().find('body')
    answerFrame.html('<h1>' + question + '</h1>')
    var notesArea = jquery('<textarea placeholder="Comments" />').appendTo(answerFrame)
    var passButton = jquery('<button>Yes</button>').appendTo(answerFrame)
    passButton.on('click', function () {
      resolve()
    })
    var failButton = jquery('<button>No</button>').appendTo(answerFrame)
    failButton.on('click', function () {
      reject(notesArea.val())
    })
  })
}

function disableAsk () {
  return Promise.resolve()
}

function run (config, windowAdapter, reporter, ask, exit) {
  function loadPage (page) {
    const { width, height } = windowAdapter.getContentSize()
    const newWidth = page.width || 1024
    const isResized = width !== newWidth
    if (isResized) {
      windowAdapter.setContentSize(newWidth, height)
    }

    var mainFrame = document.getElementById('mainFrame')

    var promise = Promise.resolve()

    if (page.visit) {
      promise = promise.then(function () {
        return page.visit(mainFrame)
      })
    }

    return promise.then(function () {
      return new Promise(function (resolve, reject) {
        function testFrame () {
          resolve(jquery(mainFrame).contents())
        }

        function loadUrl () {
          if (page.visit) {
            testFrame()
          } else {
            mainFrame.onload = function () {
              testFrame()
            }
            mainFrame.src = page.url
          }
        }

        function waitForResize () {
          setTimeout(function () {
            if (windowAdapter.measureInnerWidth() === newWidth) {
              loadUrl()
            } else {
              waitForResize()
            }
          }, 10)
        }

        if (isResized) {
          waitForResize()
        } else {
          loadUrl()
        }
      })
    })
  }

  var pages = config.pages.slice(0)
  var exitCode = 0
  reporter.runStarted()
  function checkNextPage () {
    var page = pages.shift()
    return clearStorageData()
      .then(function () {
        return setCookiesForPage(page)
      })
      .then(function () {
        return loadPage(page)
      })
      .then(function (elementScope) {
        function find (selector) {
          return elementScope.find(selector)
        }
        return new Promise(function (resolve, reject) {
          function resolveWithPageResult (pageResult) {
            var valid = !pageResult.results.find(function (r) { return r.errors.length > 0 })
            reporter.pageChecked(page, pageResult)
            if (!valid) { exitCode = 1 }
            resolve(exitCode)
          }
          try {
            a11y.test(page, find, ask)
              .then(function (r) {
                resolveWithPageResult(r)
              })
              .catch(function (e) {
                reporter.unexpectedError(e)
                reject(e)
              })
          } catch (e) {
            reporter.unexpectedError(e)
            reject(e)
          }
        })
      })
      .then(function (code) {
        if (pages.length > 0) {
          return checkNextPage()
        }
        return code
      })
      .catch(function (e) {
        reporter.unexpectedError(e)
        return 666
      })
  }

  return checkNextPage().then(function (code) {
    reporter.runEnded()
    return code
  }).then(exit)
}

function clearStorageData () {
  const session = require('electron').remote.session.defaultSession
  return new Promise(function (resolve, reject) {
    session.clearStorageData({}, function (err) {
      if (err) {
        reject(err)
      } else {
        resolve()
      }
    })
  })
}

function setCookiesForPage (page) {
  const session = require('electron').remote.session.defaultSession
  return Promise.all((page.cookies || []).map(function (cookie) {
    return new Promise(function (resolve, reject) {
      var cookieValue = Object.assign(cookie, { url: page.url })
      session.cookies.set(cookieValue, function (err) {
        if (err) {
          reject(err)
        } else {
          resolve()
        }
      })
    })
  }))
}

Runner.prototype.run = function (urlArray, windowAdapter, reporter, exit) {
  var ask = this.manualMode ? askInFrame : disableAsk
  return this.mergeConfig(urlArray)
    .catch(function (error) {
      if (error.code === 'MODULE_NOT_FOUND') { reporter.configMissing() } else { reporter.configError(error) }
      exit(2)
    })
    .then(function (mergedConfig) {
      return run(mergedConfig, windowAdapter, reporter, ask, exit)
    })
}

Runner.prototype.mergeConfig = function (urlArray) {
  if (urlArray.length === 0) {
    return configLoader.load(this.configPath)
  } else {
    return Promise.resolve({ pages: urlArray })
  }
}

module.exports = Runner
