module.exports = {
  name: 'Prefer standard operating system notifications',

  type: 'manual',

  failsForEach: 'page with non-standard notifications used where standard operating system notifications are appropriate',

  manualTest: {
    question: 'Are standard operating system notifications used where available and appropriate?',
    passText: 'Yes (or not applicable)'
  }
}
