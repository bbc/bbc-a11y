module.exports = {
  name: 'Meaningful background images must have accessible alternatives',

  type: 'manual',

  failsForEach: 'page without accessible alternatives provided for background images that convey information or meaning',

  manualTest: {
    question: 'Are accessible alternatives provided for element background images that convey information or meaning? ',
    passText: 'Yes (or not applicable)'
  }
}
