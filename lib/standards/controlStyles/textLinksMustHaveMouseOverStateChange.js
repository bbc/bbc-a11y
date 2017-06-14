module.exports = {
  name: 'Text links must have mouse over state change',

  test: function ($, fail, warn, pageConfiguration, ask) {
    return ask('Do all text links have a mouse over state change?')
      .catch(function (error) {
        fail(error)
      })
  }
}
