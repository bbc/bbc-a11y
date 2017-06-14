module.exports = {
  name: 'Editorial links must be self-evident',

  test: function ($, fail, warn, pageConfiguration, ask) {
    return ask('Are all links that are part of general editorial content self-evident, ' +
      ' identifiable by their visual style, and distinguishable from the surrounding content?')
      .catch(function (error) {
        fail(error)
      })
  }
}
