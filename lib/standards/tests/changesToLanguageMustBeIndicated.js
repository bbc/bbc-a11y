module.exports = {
  name: 'Changes to language must be indicated',

  type: 'manual',

  failsForEach: 'page that changes language with no indication',

  manualTest: {
    question: 'Are any changes to the defined language of the page indicated programmatically?',
    passText: 'Yes (or not applicable)'
  }
}
