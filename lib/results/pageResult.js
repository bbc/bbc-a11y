const StandardResult = require('./standardResult')

function PageResult (skipped, hide) {
  this.results = []
  this.skipped = skipped
  this.hide = hide
}

PageResult.prototype.addStandardResult = function (standardResult) {
  this.results.push(standardResult)
}

PageResult.prototype.createStandardResult = function (section, name) {
  var result = new StandardResult(section, name, this.hide)
  this.results.push(result)
  return result
}

PageResult.prototype.flatten = function () {
  return {
    results: this.results.map(function (result) {
      return result.flatten()
    }),
    skipped: this.skipped,
    errorsFound: this.results.reduce(function (sum, standardResult) {
      return sum + standardResult.errors.length
    }, 0)
  }
}

PageResult.prototype.test = function (standard, jquery, pageConfiguration, ask) {
  var standardResult = this.createStandardResult(standard.section, standard.name)

  function fail () { standardResult.addError(arguments) }
  function warn () { standardResult.addWarning(arguments) }

  if (typeof standard.manualTest === 'object') {
    const { passText, failText } = standard.manualTest
    return ask(standard.manualTest.question, passText, failText).catch(notes =>
      fail('Manual failure' + (notes ? `: ${notes}` : ''))
    )
  }

  function testsForFrames (framePath, $) {
    var frames = $('iframe')
    return frames.get().reduce(function (tests, frame) {
      var newPath = framePath.concat(frame)
      function frameArgs (args) { return ['In frame', newPath, ':'].concat([].slice.apply(args)) }
      function findInFrame (selector) { return $(frame).contents().find(selector) }
      function failInFrame () { fail.apply(null, frameArgs(arguments)) }
      function warnInFrame () { warn.apply(null, frameArgs(arguments)) }
      return tests
        .concat({ framePath, find: findInFrame, fail: failInFrame, warn: warnInFrame })
        .concat(testsForFrames(newPath, findInFrame))
    }, [])
  }

  var allFrameTests = [{ find: jquery, fail: fail, warn: warn }]
  if (!standard.topFrameOnly) {
    allFrameTests = allFrameTests.concat(testsForFrames([], jquery))
  }

  return allFrameTests.reduce(function (promise, frameTest) {
    return promise.then(function () {
      var testResult = standard.test({
        $: frameTest.find,
        fail: frameTest.fail,
        warn: frameTest.warn,
        pageConfiguration,
        ask
      })
      if (testResult && typeof testResult.then === 'function') {
        return testResult
      }
      return Promise.resolve()
    })
  }, Promise.resolve())
}

module.exports = PageResult
