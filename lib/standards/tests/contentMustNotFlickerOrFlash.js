module.exports = {
  name: 'Content must not flicker or flash',

  type: 'manual',

  failsForEach: 'page with flickering or flashing content',

  manualTest: {
    question: 'Does any content visibly or intentionally flicker or flash more than three times in any one-second period?',
    passText: 'No (or not applicable)',
    failText: 'Yes'
  }
}
