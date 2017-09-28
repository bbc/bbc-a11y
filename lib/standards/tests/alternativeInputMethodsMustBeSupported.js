module.exports = {
  name: 'Alternative input methods must be supported',

  type: 'manual',

  failsForEach: 'page with navigable content that does not support alternative input methods',

  manualTest: {
    question: 'Are alternative input methods supported?',
    passText: 'Yes (or not applicable)'
  }
}
