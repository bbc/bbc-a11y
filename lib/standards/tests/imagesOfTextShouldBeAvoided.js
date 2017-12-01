module.exports = {
  name: 'Images of text should be avoided',

  type: 'manual',

  failsForEach: 'page with unnecessary images of text',

  manualTest: {
    question: 'Are there any unnecessary images of text?',
    passText: 'No',
    failText: 'Yes'
  }
}
