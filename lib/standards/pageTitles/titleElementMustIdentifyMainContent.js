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
    }
  }
}
