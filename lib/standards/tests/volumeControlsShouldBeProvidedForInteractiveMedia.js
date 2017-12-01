module.exports = {
  name: 'Volume controls should be provided for interactive media',

  type: 'manual',

  failsForEach: 'page that provides no volume controls for interactive media',

  manualTest: {
    question: 'Are suitable volume controls provided for different audio layers in all interactive media?',
    passText: 'Yes (or not applicable)'
  }
}
