module.exports = {
  name: 'Notifications must be both visible and audible',

  type: 'manual',

  failsForEach: 'page with notifications that are only visible or audible, but not both',

  manualTest: {
    question: 'Are notifications both visible and audible?',
    passText: 'Yes (or not applicable)'
  }
}
