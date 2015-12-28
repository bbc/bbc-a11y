module.exports = {
  name: 'Elements with zero tab index must be fields',

  validate: function($, fail) {
    var baddies = $("*[tabindex='0']:not(input, button, select, textarea, a)");
    baddies.each(function(index, el) {
      fail('Non-field element with tabindex=0:', el);
    });
  }
}
