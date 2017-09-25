module.exports = {
  name: 'Images must have alt attributes',

  type: 'automated',

  failsForEach: 'visible <img> element that has no alt attribute',

  test: function ({ $, fail }) {
    $('img:not([alt])').each(function (index, img) {
      fail('Image has no alt attribute:', img)
    })
  }
}
