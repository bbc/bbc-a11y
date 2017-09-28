module.exports = {
  name: 'Repeated links to the same resource must be combined',

  type: 'manual',

  failsForEach: 'page with repeated links to the same resource',

  manualTest: {
    question: 'Are repeated links to the same resource combined within a single link?',
    passText: 'Yes (or not applicable)'
  }
}
