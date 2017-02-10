var xpath = require('../xpath');

function Standards(standards, skipped, hide) {
  this.standards = standards;
  this.skipped = skipped;
  this.hide = [].concat(hide);
}

Standards.sections = {

  focusableControls: {
    tests: [
      require('./focusableControls/anchorsMustHaveHrefs')
    ]
  },

  formInteractions: {
    tests: [
      require('./formInteractions/formsMustHaveSubmitButtons')
    ]
  },

  formLabels: {
    tests: [
      require('./formLabels/fieldsMustHaveLabelsOrTitles')
    ]
  },

  headings: {
    tests: [
      require('./headings/contentMustFollowHeadings'),
      require('./headings/exactlyOneMainHeading'),
      require('./headings/headingsMustBeInAscendingOrder')
    ]
  },

  imageAlternatives: {
    tests: [
      require('./imageAlternatives/imagesMustHaveAltAttributes'),
    ]
  },

  indicatingLanguage: {
    tests: [
      require('./indicatingLanguage/htmlMustHaveLangAttribute')
    ]
  },

  mainLandmark: {
    tests: [
      require('./mainLandmark/exactlyOneMainLandmark')
    ]
  },

  minimumTextSize: {
    tests: [
      require('./minimumTextSize/textCannotBeTooSmall')
    ]
  },

  tabIndex: {
    tests: [
      require('./tabIndex/elementsWithZeroTabIndexMustBeFocusableByDefault')
    ]
  },

  titleAttributes: {
    tests: [
      require('./titleAttributes/titleAttributesMustNotDuplicateContent'),
      require('./titleAttributes/titleAttributesOnlyOnInputs')
    ]
  }

}

Standards.all = [];

for (var section in Standards.sections) {
  var sectionStandards = Standards.sections[section].tests;
  for (var i = 0; i < sectionStandards.length; ++i) {
    sectionStandards[i].section = section;
    Standards.all = Standards.all.concat(sectionStandards[i]);
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

    if (this.hide) {
      var hide = this.hide
      standardResult.hiddenErrors = standardResult.errors.filter(function(error) {
        var fullErrorName = error.map(function(e) { return e.xpath || e }).join(" ")
        return (hide.find(function(substring) {
          return fullErrorName.indexOf(substring) > -1
        }))
      })
      standardResult.errors = standardResult.errors.filter(function(error) {
        return standardResult.hiddenErrors.indexOf(error) == -1
      })
    } else {
      standardResult.hiddenErrors = []
    }
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
  return new Standards(matching.matches, matching.skipped, criteria.hide);
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
