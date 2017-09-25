module.exports = {
  name: 'Html must have lang attribute',

  type: 'automated',

  failsForEach: '<html> element with no lang attribute',

  test: function ({ $, fail }) {
    $('html:not([lang])').each(function (index, html) {
      fail('html tag has no lang attribute:', html)
    })
  }
}
