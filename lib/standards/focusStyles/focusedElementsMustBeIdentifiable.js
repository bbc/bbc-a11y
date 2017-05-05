module.exports = {
  name: 'Focused elements must be identifiable',

  test: function ($, fail, warn, pageConfiguration, ask) {
    return ask('Do all focusable elements have a clearly identifiable visual style when they have focus?')
      .catch(function (error) {
        fail(error)
      })
  }
}
