module.exports = {
  name: 'An inactive space should be provided around actionable elements',

  type: 'manual',

  failsForEach: 'page that includes actionable elements with no inactive space around them',

  manualTest: {
    question: 'Is an inactive space provided around every actionable element?',
    passText: 'Yes (or not applicable)'
  }
}
