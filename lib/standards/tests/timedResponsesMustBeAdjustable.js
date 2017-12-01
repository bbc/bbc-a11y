module.exports = {
  name: 'Timed responses must be adjustable',

  type: 'manual',

  failsForEach: 'page with timed responses that are not adjustable',

  manualTest: {
    question: 'Are there any timed responses that cannot be adjusted?',
    passText: 'No',
    failText: 'Yes'
  }
}
