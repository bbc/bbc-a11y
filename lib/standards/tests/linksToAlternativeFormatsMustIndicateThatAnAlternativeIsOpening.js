module.exports = {
  name: 'Links to alternative formats must indicate that an alternative is opening',

  type: 'manual',

  failsForEach: 'page with links to alternative formats that do not indicate that an alternative is opening',

  manualTest: {
    question: 'Do all links to alternative formats indicate that an alternative is opening?',
    passText: 'Yes (or not applicable)'
  }
}
