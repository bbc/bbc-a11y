module.exports = {
  name: 'Changes to language must be indicated',

  type: 'manual',

  failsForEach: 'page that changes language with no indication',

  manualTest: {
    question: 'Are changes to language indicated?',
    passText: 'Yes (or not applicable)'
  }
}
