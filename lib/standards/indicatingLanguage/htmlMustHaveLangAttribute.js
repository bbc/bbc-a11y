module.exports = {
  name: 'Html must have lang attribute',

  validate: function($, fail) {
    $("html:not([lang])").each(function(index, html) {
      fail('html tag has no lang attribute:', html);
    });
  }
}
