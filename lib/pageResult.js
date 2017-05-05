var xpath = require('./xpath')

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

  function testsForFrames (framePath, $) {
    var frames = $('iframe')
    return frames.get().reduce(function (tests, frame) {
      var newPath = framePath.concat(frame)
      function frameArgs (args) { return ['In frame', newPath, ':'].concat([].slice.apply(args)) }
      function findInFrame (selector) { return $(frame).contents().find(selector) }
      function failInFrame () { fail.apply(null, frameArgs(arguments)) }
      function warnInFrame () { warn.apply(null, frameArgs(arguments)) }
      return tests
        .concat({ find: findInFrame, fail: failInFrame, warn: warnInFrame })
        .concat(testsForFrames(newPath, findInFrame))
    }, [])
  }

  var tests = [{ find: jquery, fail: fail, warn: warn }].concat(testsForFrames([], jquery))

  return Promise.all(tests.map(function (test) {
    var testResult = standard.test(test.find, test.fail, test.warn, pageConfiguration, ask)
    return testResult && typeof testResult.then === 'function' ? testResult.then() : Promise.resolve()
  }))
}

function StandardResult (section, name, hide) {
  this.standard = { section: section, name: name }
  this.errors = []
  this.warnings = []
  this.hiddenErrors = []
  this.hide = hide
}

StandardResult.prototype.addError = function (errorChain) {
  this.errors.push(xpath.replaceElementsWithXPaths(errorChain))

  if (this.hide) {
    var standardResult = this
    var hide = this.hide
    standardResult.hiddenErrors = standardResult.errors.filter(function (error) {
      var fullErrorName = error.map(function (e) { return e.xpath || e }).join(' ')
      return (hide.find(function (substring) {
        return fullErrorName.indexOf(substring) > -1
      }))
    })
    standardResult.errors = standardResult.errors.filter(function (error) {
      return standardResult.hiddenErrors.indexOf(error) === -1
    })
  }
}

StandardResult.prototype.addWarning = function (errorChain) {
  this.warnings.push(xpath.replaceElementsWithXPaths(errorChain))
}

StandardResult.prototype.flatten = function () {
  return {
    standard: {
      section: this.standard.section.title,
      name: this.standard.name
    },
    errors: this.errors.map(removeElementsFrom),
    warnings: this.warnings.map(removeElementsFrom),
    hiddenErrors: this.hiddenErrors.map(removeElementsFrom)
  }
}

function removeElementsFrom (error) {
  return error.map(function (part) { delete part.element; return part })
}

module.exports = PageResult
