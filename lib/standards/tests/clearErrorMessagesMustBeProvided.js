module.exports = {
  name: 'Clear error messages must be provided',

  type: 'manual',

  failsForEach: 'page that provides unclear error messages',

  manualTest: {
    question: 'Are clear error messages provided?',
    passText: 'Yes (or not applicable)'
  }
}
