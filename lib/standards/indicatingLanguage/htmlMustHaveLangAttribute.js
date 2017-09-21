module.exports = {
  name: 'Html must have lang attribute',

  test: function ({ $, fail }) {
    $('html:not([lang])').each(function (index, html) {
      fail('html tag has no lang attribute:', html)
    })
  }
}
