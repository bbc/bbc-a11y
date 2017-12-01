module.exports = {
  name: 'Relevant metadata should be provided for all media',

  type: 'manual',

  failsForEach: 'page with media that is missing relevant metadata',

  manualTest: {
    question: 'Is relevant metadata provided for all media?',
    passText: 'Yes (or not applicable)'
  }
}
