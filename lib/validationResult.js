var xpath = require('./xpath')

function ValidationResult(skipped, hide) {
  this.results = []
  this.skipped = skipped
  this.hide = hide
}

ValidationResult.prototype.addStandardResult = function (standardResult) {
  this.results.push(standardResult)
}

ValidationResult.prototype.createStandardResult = function(section, name) {
  var result = new StandardResult(section, name)
  this.results.push(result)
  return result
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

module.exports = ValidationResult
