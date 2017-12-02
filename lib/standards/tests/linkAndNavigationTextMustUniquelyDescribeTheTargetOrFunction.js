module.exports = {
  name: 'Link and navigation text must uniquely describe the target or function',

  type: 'manual',

  failsForEach: 'page with links or navigation text that does not uniquely describe the target or function of the link or item',

  manualTest: {
    question: 'Does each link and navigation text uniquely describe the target or function of the link or item?'
  }
}
