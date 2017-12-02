module.exports = {
  name: 'Touch targets must be large enough to touch accurately',

  type: 'manual',

  failsForEach: 'page that includes touch targets that are too small to touch accurately',

  manualTest: {
    question: 'Are all touch targets large enough for accurate interaction (larger than 7mm x 7mm)?'
  }
}
