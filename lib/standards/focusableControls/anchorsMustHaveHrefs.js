module.exports = {
  name: 'Anchors must have hrefs',

  test: function ({ $, fail }) {
    $('a:not([href]):visible').each(function (index, anchor) {
      fail('Anchor has no href attribute:', anchor)
    })
  }
}
