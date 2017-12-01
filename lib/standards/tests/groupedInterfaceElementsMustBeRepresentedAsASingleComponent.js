module.exports = {
  name: 'Grouped interface elements must be represented as a single component',

  type: 'manual',

  failsForEach: 'page with controls, objects and grouped interface elements not represented as a single accessible component',

  manualTest: {
    question: 'Are controls, objects and grouped interface elements represented as a single accessible component?',
    passText: 'Yes (or not applicable)'
  }
}
