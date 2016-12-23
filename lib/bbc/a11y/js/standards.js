var xpath = require('./xpath');

function Standards(standards, skipped, only) {
  this.standards = standards;
  this.skipped = skipped;
  this.only = only;
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
    require('./standards/minimumTextSize/textCannotBeTooSmall')
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
  var sectionStandards = Standards.sections[section];
  for (var i = 0; i < sectionStandards.length; ++i) {
    sectionStandards[i].section = section;
    Standards.all.push(sectionStandards[i]);
  }
}

Standards.prototype.validate = function(jquery) {
  var results = [];
  var standardResult;
  function fail() {
    standardResult.errors.push(xpath.replaceElementsWithXPaths(arguments));
  }
  for (var i = 0; i < this.standards.length; ++i) {
    standard = this.standards[i];
    standardResult = {
      standard: {
        section: this.standards[i].section,
        name: this.standards[i].name
      },
      errors: []
    };

    standard.validate(jquery, fail);

    function validateFrames(framePath, $) {
      var frames = $('iframe')
      for (var f = 0; f < frames.length; f++) {
        var thisFramePath = framePath.concat(frames[f])
        function findInFrame(selector) { return $(frames[f]).contents().find(selector) }
        function failInFrame() {
          var args = ['In frame',
            xpath.replaceElementsWithXPaths(thisFramePath),
            ':'
          ].concat([].slice.apply(arguments))
          fail.apply(null, args)
        }
        standard.validate(findInFrame, failInFrame)
        validateFrames(thisFramePath, findInFrame)
      }
    }

    validateFrames([], jquery)

    results.push(standardResult);
  }
  return { results: results, skipped: this.skipped };
}

Standards.matching = function(criteria) {
  if (typeof(criteria) == 'undefined') {
    return Standards.matching({});
  }
  if (typeof(criteria) == 'string') {
    return Standards.matching({ only: [criteria] });
  }
  var matching = standardsMatching(criteria);
  return new Standards(matching.matches, matching.skipped);
}

function standardsMatching(criteria) {
  var skips = criteria.skip || [];
  for (var i = 0; i < skips.length; ++i) {
    skips[i] = normaliseStandardName(skips[i]);
  }
  var onlies = criteria.only || [];
  for (var i = 0; i < onlies.length; ++i) {
    onlies[i] = normaliseStandardName(onlies[i]);
  }
  var matches = [];
  var skipped = [];
  for (var i = 0; i < Standards.all.length; ++i) {
    var standard = Standards.all[i];
    var name = standard.section.toLowerCase() + normaliseStandardName(standard.name);
    if (onlies.length > 0) {
      if (onlies.indexOf(name) > -1) {
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

function normaliseStandardName(name) {
  return name.replace(/\W+/g, '').toLowerCase();
}

module.exports = Standards;
