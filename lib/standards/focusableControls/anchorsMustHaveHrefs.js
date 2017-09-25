module.exports = {
  name: 'Anchors must have hrefs',

  type: 'automated',

  failsForEach: 'visible <a> element with no href attribute',

  test: function ({ $, fail }) {
    $('a:not([href]):visible').each(function (index, anchor) {
      fail('Anchor has no href attribute:', anchor)
    })
  }
}
