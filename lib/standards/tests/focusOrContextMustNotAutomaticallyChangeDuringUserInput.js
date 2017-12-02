module.exports = {
  name: 'Focus or context must not automatically change during user input',

  type: 'manual',

  failsForEach: 'page with focus or context that changes automatically during user input',

  manualTest: {
    question: 'Does focus or context automatically change during user input?',
    passText: 'No (or not applicable)',
    failText: 'Yes'
  }
}
