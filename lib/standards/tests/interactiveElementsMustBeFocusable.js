module.exports = {
  name: 'Interactive elements must be focusable',

  type: 'manual',

  failsForEach: 'page with interactive elements that are not focusable',

  manualTest: {
    question: 'Are all (and only) interactive elements focusable?'
  }
}
