module.exports = {
  name: 'Colour combinations must pass the WCAG colour contrast check',

  type: 'manual',

  failsForEach: 'page whose colour combinations fail the WCAG colour contrast check',

  manualTest: {
    question: 'Do all colour combinations pass the ' +
      '<a target="_blank" href="https://snook.ca/technical/colour_contrast/colour.html">Snook colour contrast check</a>?'
  }
}
