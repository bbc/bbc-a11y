module.exports = {
  name: 'Visual formatting alone must not be used to convey meaning',

  type: 'manual',

  failsForEach: 'page where visual formatting alone is used to convey meaning',

  manualTest: {
    question: 'Is visual formatting alone used to convey meaning?',
    passText: 'No',
    failText: 'Yes'
  }
}
