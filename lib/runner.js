var a11y = require('./a11y')
var jquery = require('jquery')

var cookies = require('./electron/cookies')
var storage = require('./electron/storage')

var Standards = require('./standards')

var configLoader = require('./config/loader')
jquery('#answerFrame').contents().find('head').append('<link rel="stylesheet" type="text/css" href="answerFrame.css">')

function askInFrame (question, passText, failText) {
  jquery('#answerFrame').show()
  return new Promise(function (resolve, reject) {
    var answerFrame = jquery('#answerFrame').contents().find('body')
    answerFrame.html('<h1>' + question + '</h1>')
    var commentsArea = jquery('<div class="comments" />').appendTo(answerFrame)
    var commentsBox = jquery('<textarea placeholder="Comments" />').appendTo(commentsArea)
    var passButton = jquery('<button class="pass-button">' + (passText || 'Yes') + '</button>').appendTo(commentsArea)
    passButton.on('click', function () {
      answerFrame.html('')
      resolve()
    })
    var failButton = jquery('<button class="fail-button">' + (failText || 'No') + '</button>').appendTo(commentsArea)
    failButton.on('click', function () {
      answerFrame.html('')
      reject(commentsBox.val())
    })
  })
}

function disableAsk () {
  return Promise.resolve()
}

function run ({ config, windowAdapter, reporter, ask, summariseTests, exit }) {
  if (summariseTests) {
    if (typeof reporter.summariseTests === 'function') {
      reporter.summariseTests(Standards)
      return exit(0)
    } else {
      reporter.unexpectedError(new Error(reporter.constructor.name + ' does not support summarising standards'))
      return exit(1)
    }
  }

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
          }, 50)
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
    return storage.clear()
      .then(function () {
        return cookies.set(page)
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

function Runner ({ configPath, runManualTests, pages, windowAdapter, reporter, summariseTests, exit }) {
  this.configPath = configPath
  this.runManualTests = runManualTests
  this.pages = pages
  this.windowAdapter = windowAdapter
  this.reporter = reporter
  this.summariseTests = summariseTests
  this.exit = exit
}

Runner.prototype.run = function () {
  var ask = this.runManualTests ? askInFrame : disableAsk
  return this.mergeConfig()
    .catch(error => {
      if (error.code === 'MODULE_NOT_FOUND') { this.reporter.configMissing() } else { this.reporter.configError(error) }
      this.exit(2)
    })
    .then(config => {
      return run({
        config,
        windowAdapter: this.windowAdapter,
        reporter: this.reporter,
        ask,
        summariseTests: this.summariseTests,
        exit: this.exit
      })
    })
}

Runner.prototype.mergeConfig = function () {
  if (this.summariseTests) return Promise.resolve({ pages: [] })
  if (this.pages.length === 0) {
    return configLoader.loadConfigFromPath(this.configPath)
  } else {
    return Promise.resolve({ pages: this.pages })
  }
}

module.exports = Runner
