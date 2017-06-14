module.exports = {
  name: 'Information conveyed with colour must also be identifiable from context or markup.',

  test: function ($, fail, warn, pageConfiguration, ask) {
    return ask('Is information conveyed with colour also identifiable from context or markup?')
      .catch(function (error) {
        fail(error)
      })
  }
}
