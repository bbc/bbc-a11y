module.exports = {
  name: 'Colour combinations must pass the WCAG colour contrast check',

  type: 'manual',

  failsForEach: 'page whose colour combinations fail the WCAG colour contrast check',

  manualTest: {
    question: 'Do all text and background colour combinations pass a reliable ' +
      '<a target="_blank" href="https://snook.ca/technical/colour_contrast/colour.html">colour contrast check</a>?'
  }
}
