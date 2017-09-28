module.exports = {
  name: 'Alternatives must briefly describe editorial intent',

  type: 'manual',

  failsForEach: 'page where alternatives do not briefly describe the editorial intent or purpose of images, objects, or elements',

  manualTest: {
    question: 'Do alternatives briefly describe the editorial intent or purpose of the image, object, or element?',
    passText: 'Yes (or not applicable)'
  }
}
