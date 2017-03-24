var xpath = require('./xpath')

function PageResult(skipped, hide) {
  this.results = []
  this.skipped = skipped
  this.hide = hide
}

PageResult.prototype.addStandardResult = function (standardResult) {
  this.results.push(standardResult)
}

PageResult.prototype.createStandardResult = function(section, name) {
  var result = new StandardResult(section, name)
  this.results.push(result)
  return result
}

PageResult.prototype.flatten = function() {
  return {
    results: this.results.map(function(result) {
      return result.flatten()
    }),
    skipped: this.skipped,
    errorsFound: this.results.reduce(function(sum, standardResult) {
      return sum + standardResult.errors.length
    }, 0)
  }
}

function StandardResult(section, name) {
  this.standard = { section: section, name: name }
  this.errors = []
  this.warnings = []
  this.hiddenErrors = []
}

StandardResult.prototype.addError = function(errorChain) {
   this.errors.push(xpath.replaceElementsWithXPaths(errorChain))
}

StandardResult.prototype.addWarning = function(errorChain) {
   this.warnings.push(xpath.replaceElementsWithXPaths(errorChain))
}

StandardResult.prototype.flatten = function() {
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

function removeElementsFrom(error) {
  return error.map(function(part) { delete part.element; return part })
}

module.exports = PageResult
