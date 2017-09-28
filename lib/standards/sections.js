module.exports = {
  'bbc-html-corePurpose': {
    title: 'Core purpose',
    tests: [
      require('./tests/corePurposeMustBeDefined')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/core-purpose.shtml'
  },

  'bbc-html-colourAndMeaning': {
    title: 'Colour and meaning',
    tests: [
      require('./tests/informationConveyedWithColourMustAlsoBeIdentifiableFromContextOrMarkup')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/colour-meaning.shtml'
  },

  'bbc-html-colourContrast': {
    title: 'Colour contrast',
    tests: [
      require('./tests/colourCombinationsMustPassColourContrastCheck')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/colour-contrast.shtml'
  },

  'bbc-html-controlStyles': {
    title: 'Control styles',
    tests: [
      require('./tests/editorialLinksMustBeSelfEvident'),
      require('./tests/textLinksMustHaveMouseOverStateChange')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/control-styles.shtml'
  },

  'bbc-html-focusableControls': {
    title: 'Focusable controls',
    tests: [
      require('./tests/anchorsMustHaveHrefs')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/focusable-controls.shtml'
  },

  'bbc-html-focusStyles': {
    title: 'Focus styles',
    tests: [
      require('./tests/focusedElementsMustBeIdentifiable')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/focus-styles.shtml'
  },

  'bbc-html-formInteractions': {
    title: 'Form interactions',
    tests: [
      require('./tests/formsMustHaveSubmitButtons')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-interaction.shtml'
  },

  'bbc-html-formLabels': {
    title: 'Form labels',
    tests: [
      require('./tests/fieldsMustHaveLabelsOrTitles')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/form-labels.shtml'
  },

  'bbc-html-headings': {
    title: 'Headings',
    tests: [
      require('./tests/contentMustFollowHeadings'),
      require('./tests/exactlyOneMainHeading'),
      require('./tests/headingsMustBeInAscendingOrder')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/headings.shtml'
  },

  'bbc-html-imageAlternatives': {
    title: 'Image alternatives',
    tests: [
      require('./tests/imagesMustHaveAltAttributes')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/image-alt.shtml'
  },

  'bbc-html-indicatingLanguage': {
    title: 'Indicating language',
    tests: [
      require('./tests/htmlMustHaveLangAttribute')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/language.shtml'
  },

  'bbc-html-mainLandmark': {
    title: 'Main landmark',
    tests: [
      require('./tests/exactlyOneMainLandmark')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/main-landmark.shtml'
  },

  'bbc-html-minimumTextSize': {
    title: 'Minimum text size',
    tests: [
      require('./tests/textCannotBeTooSmall')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/min-text-size.shtml'
  },

  'bbc-html-progressiveEnhancement': {
    title: 'Progressive enhancement',
    tests: [
      require('./tests/documentMustNotRequireJavaScriptOrCssToFunction')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/progressive-enhancement.shtml'
  },

  'bbc-html-resizableText': {
    title: 'Resizable text',
    tests: [
      require('./tests/contentMustBeVisibleAndUsableWithPageZoomed'),
      require('./tests/contentMustBeVisibleAndUsableWithTextResized'),
      require('./tests/textMustBeStyledWithUnitsThatAreResizableInAllBrowsers')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/resize-zoom.shtml'
  },

  'bbc-html-titles': {
    title: 'Page titles',
    tests: [
      require('./tests/titleElementMustIdentifyMainContent')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/page-titles.shtml'
  },

  'bbc-html-tabIndex': {
    title: 'Tab index',
    tests: [
      require('./tests/elementsWithZeroTabIndexMustBeFocusableByDefault')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tabindex.shtml'
  },

  'bbc-html-tables': {
    title: 'Tables',
    tests: [
      require('./tests/useTablesForData')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/tables.shtml'
  },

  'bbc-html-titleAttributes': {
    title: 'Title attributes',
    tests: [
      require('./tests/titleAttributesMustNotDuplicateContent'),
      require('./tests/titleAttributesOnlyOnInputs')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/title-attributes.shtml'
  },

  'bbc-html-validation': {
    title: 'Validation',
    tests: [
      require('./tests/allDocumentsMustHaveAW3cRecommendedDoctype'),
      require('./tests/markupMustValidateAgainstDoctype')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/validation.shtml'
  },

  'bbc-html-visibleOnFocus': {
    title: 'Visible on focus',
    tests: [
      require('./tests/elementsMustBeVisibleOnFocus')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/html/visible-on-focus.shtml'
  }

}
