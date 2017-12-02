module.exports = {
  name: 'Media that updates and animation must have a pause, stop or hide control',

  type: 'manual',

  failsForEach: 'page with media that updates or animation that has no pause, stop or hide control',

  manualTest: {
    question: 'Does all media that updates or is animated content have a pause, stop or hide control?',
    passText: 'Yes (or not applicable)'
  }
}
