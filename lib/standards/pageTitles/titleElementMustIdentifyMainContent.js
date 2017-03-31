module.exports = {
  name: 'Title element must identify main content',

  validate: function($, fail, warn, pageConfiguration) {
    if (typeof pageConfiguration.pageTitleFormat == 'function') {
      var actualTitle = $('title').text()
      var expectedTitle = pageConfiguration.pageTitleFormat($)
      if (expectedTitle != actualTitle) {
        fail('Title element failed to identify main content: ' +
             'expected "' + expectedTitle + '", actual "' + actualTitle + '"')
      }
    } else if (typeof pageConfiguration.pageTitleFormat === 'string') {
      var actualTitle = $('title').text()
      var expectedTitle = pageConfiguration.pageTitleFormat
      var templatePart = expectedTitle.match(/\{([^}].+)\}/)
      if (templatePart) {
        var templatePartText = $(templatePart[1]).text()
        expectedTitle = expectedTitle.replace(templatePart[0], templatePartText)
      }
      if (expectedTitle != actualTitle) {
        fail('Title element failed to identify main content: ' +
             'expected "' + expectedTitle + '", actual "' + actualTitle + '"')
      }
    } else {
      fail('Invalid pageTitleFormat ' + pageConfiguration.pageTitleFormat.toString())
    }
  }
}
