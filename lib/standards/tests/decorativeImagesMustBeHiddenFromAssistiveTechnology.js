module.exports = {
  name: 'Decorative images must be hidden from assistive technology',

  type: 'manual',

  failsForEach: 'page where decorative images are not hidden from assistive technology',

  manualTest: {
    question: 'Are decorative images hidden from assistive technology?',
    passText: 'Yes (or not applicable)'
  }
}
