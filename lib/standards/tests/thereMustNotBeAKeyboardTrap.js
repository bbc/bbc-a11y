module.exports = {
  name: 'There must not be a keyboard trap',

  type: 'manual',

  failsForEach: 'page that has a keyboard trap',

  manualTest: {
    question: 'Is anything a keyboard trap?',
    passText: 'No',
    failText: 'Yes'
  }
}
