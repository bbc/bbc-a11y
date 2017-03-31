module.exports = {
  name: 'Title element must identify main content',

  validate: function($, fail, warn, pageConfiguration) {
    if (typeof pageConfiguration.title == 'function') {
      var actualTitle = $('title').text()
      var expectedTitle = pageConfiguration.title($)
      if (expectedTitle != actualTitle) {
        fail('Title element failed to identify main content: ' +
             'expected "' + expectedTitle + '", actual "' + actualTitle + '"')
      }
    } else if (typeof pageConfiguration.title === 'string') {
      var actualTitle = $('title').text()
      var expectedTitle = pageConfiguration.title
      var templatePart = expectedTitle.match(/\{([^}].+)\}/)
      if (templatePart) {
        var templatePartText = $(templatePart[1]).text()
        expectedTitle = expectedTitle.replace(templatePart[0], templatePartText)
      }
      if (expectedTitle != actualTitle) {
        fail('Title element failed to identify main content: ' +
             'expected "' + expectedTitle + '", actual "' + actualTitle + '"')
      }
    } else if (typeof pageConfiguration.title !== 'undefined') {
      fail('Invalid title ' + pageConfiguration.title.toString())
    }
  }
}
