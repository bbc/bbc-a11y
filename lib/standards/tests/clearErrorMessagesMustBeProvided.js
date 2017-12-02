module.exports = {
  name: 'Clear error messages must be provided',

  type: 'manual',

  failsForEach: 'page that provides unclear error messages',

  manualTest: {
    question: 'Are clear accessible error messages provided when needed?',
    passText: 'Yes (or not applicable)'
  }
}
