module.exports = {
  name: 'Images must have alt attributes',

  validate: function($, fail) {
    $("img:not([alt])").each(function(index, img) {
      fail('Image has no alt attribute:', img);
    });
  }
}
