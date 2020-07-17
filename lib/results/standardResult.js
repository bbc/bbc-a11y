const xpath = require('./xpath')

function StandardResult (section, name, hide) {
  this.standard = { section: section, name: name }
  this.errors = []
  this.warnings = []
  this.hiddenErrors = []
  this.hiddenWarnings = []
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

  if (this.hide) {
    var standardResult = this
    var hide = this.hide
    standardResult.hiddenWarnings = standardResult.warnings.filter(function (warning) {
      var fullWarningName = warning.map(function (e) { return e.xpath || e }).join(' ')
      return (hide.find(function (substring) {
        return fullWarningName.indexOf(substring) > -1
      }))
    })
    standardResult.warnings = standardResult.warnings.filter(function (warning) {
      return standardResult.hiddenWarnings.indexOf(warning) === -1
    })
  }
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

StandardResult.prototype.copyTo = function (otherStandardResult) {
  otherStandardResult.errors = this.errors
  otherStandardResult.warnings = this.warnings
  otherStandardResult.hiddenErrors = this.hiddenErrors
}

function removeElementsFrom (error) {
  return error.map(function (part) { delete part.element; return part })
}

module.exports = StandardResult
