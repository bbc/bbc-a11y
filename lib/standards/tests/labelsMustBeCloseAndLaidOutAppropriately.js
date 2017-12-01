module.exports = {
  name: 'Labels must be close and laid out appropriately',

  type: 'manual',

  failsForEach: 'page with labels that are not close to the relevant form control, or laid out inappropriately',

  manualTest: {
    question: 'Are labels placed close to the relevant form control, and laid out appropriately?',
    passText: 'Yes (or not applicable)'
  }
}
