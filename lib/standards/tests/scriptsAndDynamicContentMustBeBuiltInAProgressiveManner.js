module.exports = {
  name: 'Scripts and dynamic content must be built in a progressive manner',

  type: 'manual',

  failsForEach: 'page with scripts and dynamic content that is not built in a progressive manner',

  manualTest: {
    question: 'Are scripts and dynamic content added in a progressive manner?',
    passText: 'Yes (or not applicable)'
  }
}
