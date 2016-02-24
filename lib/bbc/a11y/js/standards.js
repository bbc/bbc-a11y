var xpath = require('./xpath');

function Standards(standards, skipped) {
  this.standards = standards;
  this.skipped = skipped;
}

Standards.sections = {

  focusableControls: [
    require('./standards/focusableControls/anchorsMustHaveHrefs')
  ],

  formInteractions: [
    require('./standards/formInteractions/formsMustHaveSubmitButtons')
  ],

  formLabels: [
    require('./standards/formLabels/fieldsMustHaveLabelsOrTitles')
  ],

  headings: [
    require('./standards/headings/contentMustFollowHeadings'),
    require('./standards/headings/exactlyOneMainHeading'),
    require('./standards/headings/headingsMustBeInAscendingOrder')
  ],

  imageAlternatives: [
    require('./standards/imageAlternatives/imagesMustHaveAltAttributes'),
  ],

  indicatingLanguage: [
    require('./standards/indicatingLanguage/htmlMustHaveLangAttribute')
  ],

  mainLandmark: [
    require('./standards/mainLandmark/exactlyOneMainLandmark')
  ],

  minimumTextSize: [
    require('./standards/minimumTextSize/minimumTextSize')
  ],

  tabIndex: [
    require('./standards/tabIndex/elementsWithZeroTabIndexMustBeFields')
  ],

  titleAttributes: [
    require('./standards/titleAttributes/titleAttributesOnlyOnInputs')
  ]

}

Standards.all = [];

for (var section in Standards.sections) {
  Standards.all = Standards.all.concat(Standards.sections[section]);
}

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
