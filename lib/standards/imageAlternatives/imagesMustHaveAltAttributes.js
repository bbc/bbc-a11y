module.exports = {
  name: 'Images must have alt attributes',

  test: function ({ $, fail }) {
    $('img:not([alt])').each(function (index, img) {
      fail('Image has no alt attribute:', img)
    })
  }
}
