module.exports = {
  name: 'Automatic page refreshes must not be used without warning',

  type: 'manual',

  failsForEach: 'page that refreshes automatically without warning',

  manualTest: {
    question: 'Does the page refresh automatically without warning?',
    passText: 'No',
    failText: 'Yes'
  }
}
