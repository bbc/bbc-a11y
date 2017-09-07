module.exports = {
  name: 'Title element must identify main content',

  test: function ({ $, fail, warn, pageConfiguration }) {
    function testTitle (expected) {
      var actual = $('title').text()
      if (expected !== actual) {
        fail('Title element failed to identify main content: ' +
             'expected "' + expected + '", actual "' + actual + '"')
      }
    }
    switch (typeof pageConfiguration.title) {
      case 'undefined':
        return
      case 'function':
        return testTitle(pageConfiguration.title($))
      case 'string':
        var expected = pageConfiguration.title
        var template = expected.match(/\{([^}].+)\}/)
        if (template) {
          expected = expected.replace(template[0], $(template[1]).text())
        }
        return testTitle(expected)
    }
    fail('Invalid title ' + pageConfiguration.title.toString())
  }
}
