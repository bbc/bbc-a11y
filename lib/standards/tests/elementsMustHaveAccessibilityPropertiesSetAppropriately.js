module.exports = {
  name: 'Elements must have accessibility properties set appropriately',

  type: 'manual',

  failsForEach: 'page where elements do not have accessibility properties set appropriately',

  manualTest: {
    question: 'Do elements have accessibility properties set appropriately?',
    passText: 'Yes (or not applicable)'
  }
}
