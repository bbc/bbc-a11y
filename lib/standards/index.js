var PageResult = require('../results/pageResult')
var sections = require('./sections')

function Standards (standards, skipped, hide) {
  this.standards = standards
  this.skipped = skipped
  this.hide = [].concat(hide)
}

Standards.sections = sections

Standards.all = []

for (var section in sections) {
  var sectionTests = sections[section].tests
  for (var i = 0; i < sectionTests.length; ++i) {
    const testWithSectionReference = Object.assign({}, sectionTests[i])
    testWithSectionReference.section = sections[section]
    Standards.all.push(testWithSectionReference)
  }
}

Standards.prototype.test = function (jquery, pageConfiguration, ask) {
  var pageResult = new PageResult(this.skipped, this.hide)
  return this.standards.reduce(function (promise, standard) {
    return promise.then(function () {
      return pageResult.test(standard, jquery, pageConfiguration, ask)
    })
  }, Promise.resolve())
    .then(function () {
      return pageResult
    })
}

Standards.matching = function (criteria) {
  if (typeof (criteria) === 'undefined') {
    return Standards.matching({})
  }
  if (typeof (criteria) === 'string') {
    return Standards.matching({ only: [criteria] })
  }
  var matching = standardsMatching(criteria)
  return new Standards(matching.matches, matching.skipped, criteria.hide)
}

function standardsMatching (criteria) {
  var skips = criteria.skip || []
  var onlies = criteria.only || []
  var matches = []
  var skipped = []
  for (var i = 0; i < Standards.all.length; ++i) {
    var standard = Standards.all[i]
    var name = standard.section.title + ': ' + standard.name
    if (onlies.length > 0) {
      if (onlies.indexOf(name) > -1) {
        matches.push(standard)
      } else {
        skipped.push(standard)
      }
    } else if (skips.indexOf(name) === -1) {
      matches.push(standard)
    } else {
      skipped.push({ section: standard.section.title, name: standard.name })
    }
  }
  return { matches: matches, skipped: skipped }
}

module.exports = Standards
