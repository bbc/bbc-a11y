var xpath = require('./xpath');

function Standards(standards, skipped) {
  this.standards = standards;
  this.skipped = skipped;
}

Standards.all = [
  require('./standards/anchorsMustHaveHrefs'),
  require('./standards/contentMustFollowHeadings'),
  require('./standards/elementsWithZeroTabIndexMustBeFields'),
  require('./standards/exactlyOneMainHeading'),
  require('./standards/exactlyOneMainLandmark'),
  require('./standards/fieldsMustHaveLabelsOrTitles'),
  require('./standards/formsMustHaveSubmitButtons'),
  require('./standards/headingsMustBeInAscendingOrder'),
  require('./standards/htmlMustHaveLangAttribute'),
  require('./standards/imagesMustHaveAltAttributes'),
  require('./standards/minimumTextSize'),
  require('./standards/titleAttributesOnlyOnInputs')
];

Standards.prototype.validate = function(jquery) {
  var results = [];
  var standardResult;
  function fail() {
    standardResult.errors.push(xpath.replaceElementsWithXPaths(arguments));
  }
  for (var i = 0; i < this.standards.length; ++i) {
    standard = this.standards[i];
    standardResult = { standard: this.standards[i].name, errors: [] };
    standard.validate(jquery, fail);
    results.push(standardResult);
  }
  return { results: results, skipped: this.skipped };
}

Standards.matching = function(criteria) {
  if (typeof(criteria) == 'undefined') {
    return Standards.matching({});
  }
  if (typeof(criteria) == 'string') {
    return Standards.matching({ only: criteria });
  }
  var matching = standardsMatching(criteria);
  return new Standards(matching.matches, matching.skipped);
}

function standardsMatching(criteria) {
  var skips = criteria.skip || [];
  for (var i = 0; i < skips.length; ++i) {
    skips[i] = normalise(skips[i]);
  }
  var isOnly = typeof(criteria.only) == 'string';
  var only = isOnly ? normalise(criteria.only) : null;
  var matches = [];
  var skipped = [];
  for (var i = 0; i < Standards.all.length; ++i) {
    var standard = Standards.all[i];
    var name = normalise(standard.name);
    if (isOnly) {
      if (only == name) {
        matches.push(standard);
      } else {
        skipped.push(standard.name);
      }
    } else if (skips.indexOf(name) == -1) {
      matches.push(standard);
    } else {
      skipped.push(standard.name);
    }
  }
  return { matches: matches, skipped: skipped };
}

function normalise(name) {
  return name.replace(/\s+/g, '').toLowerCase();
}

module.exports = Standards;
