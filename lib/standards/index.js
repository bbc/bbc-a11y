var xpath = require('../xpath');

function Standards(standards, skipped, hide) {
  this.standards = standards;
  this.skipped = skipped;
  this.hide = [].concat(hide);
}

Standards.sections = {

  focusableControls: {
    title: 'Focusable controls',
    tests: [
      require('./focusableControls/anchorsMustHaveHrefs')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/focusable-controls.shtml'
  },

  formInteractions: {
    title: 'Form interactions',
    tests: [
      require('./formInteractions/formsMustHaveSubmitButtons')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-interaction.shtml'
  },

  formLabels: {
    title: 'Form labels',
    tests: [
      require('./formLabels/fieldsMustHaveLabelsOrTitles')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-labels.shtml'
  },

  headings: {
    title: 'Headings',
    tests: [
      require('./headings/contentMustFollowHeadings'),
      require('./headings/exactlyOneMainHeading'),
      require('./headings/headingsMustBeInAscendingOrder')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml'
  },

  imageAlternatives: {
    title: 'Image alternatives',
    tests: [
      require('./imageAlternatives/imagesMustHaveAltAttributes'),
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/image-alt.shtml'
  },

  indicatingLanguage: {
    title: 'Indicating language',
    tests: [
      require('./indicatingLanguage/htmlMustHaveLangAttribute')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/language.shtml'
  },

  mainLandmark: {
    title: 'Main landmark',
    tests: [
      require('./mainLandmark/exactlyOneMainLandmark')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/main-landmark.shtml'
  },

  minimumTextSize: {
    title: 'Minimum text size',
    tests: [
      require('./minimumTextSize/textCannotBeTooSmall')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/min-text-size.shtml'
  },

  tabIndex: {
    title: 'Tab index',
    tests: [
      require('./tabIndex/elementsWithZeroTabIndexMustBeFocusableByDefault')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tabindex.shtml'
  },

  titleAttributes: {
    title: 'Title attributes',
    tests: [
      require('./titleAttributes/titleAttributesMustNotDuplicateContent'),
      require('./titleAttributes/titleAttributesOnlyOnInputs')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml'
  }

}

Standards.all = [];

for (var section in Standards.sections) {
  var sectionStandards = Standards.sections[section].tests;
  for (var i = 0; i < sectionStandards.length; ++i) {
    sectionStandards[i].section = Standards.sections[section];
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
  var onlies = criteria.only || [];
  var matches = [];
  var skipped = [];
  for (var i = 0; i < Standards.all.length; ++i) {
    var standard = Standards.all[i];
    var name = standard.section.title + ': ' + standard.name;
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


module.exports = Standards;
