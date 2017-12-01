module.exports = {
  name: 'Information conveyed with colour must also be identifiable from context or markup',

  type: 'manual',

  failsForEach: 'page whose information conveyed with colour is not also identifiable from context or markup',

  manualTest: {
    question: 'Is all information conveyed by colour also conveyed by other means, such as additional style, context or markup?',
    passText: 'Yes (or not applicable)'
  }
}
