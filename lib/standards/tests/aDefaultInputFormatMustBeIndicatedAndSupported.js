module.exports = {
  name: 'A default input format must be indicated and supported',

  type: 'manual',

  failsForEach: 'page where a default input format is not indicated or supported',

  manualTest: {
    question: 'Is a default input format indicated/implied and supported?',
    passText: 'Yes (or not applicable)'
  }
}
