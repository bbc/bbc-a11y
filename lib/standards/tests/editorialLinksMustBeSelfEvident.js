module.exports = {
  name: 'Editorial links must be self-evident',

  type: 'manual',

  failsForEach: '<a> that is part of general editorial content, that is not' +
    ' identifiable by its visual style, and distinguishable from the surrounding content',

  manualTest: {
    question: 'Are all links, buttons and other actionable elements in the content self-evident, ' +
     'identifiable by their visual style, and distinguishable from surrounding content?'
  }
}
