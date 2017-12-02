module.exports = {
  name: 'Tooltips must not repeat link text or other alternatives',

  type: 'manual',

  failsForEach: 'page where tooltips repeat link text or other alternatives',

  manualTest: {
    question: 'Do tooltips repeat link text or other alternatives?',
    passText: 'No (or not applicable)',
    failText: 'Yes'
  }
}
