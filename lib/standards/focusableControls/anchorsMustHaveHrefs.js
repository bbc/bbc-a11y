module.exports = {
  name: 'Anchors must have hrefs',

  validate: function($, fail) {
    $("a:not([href])").each(function(index, anchor) {
      fail('Anchor has no href attribute:', anchor);
    });
  }
}
