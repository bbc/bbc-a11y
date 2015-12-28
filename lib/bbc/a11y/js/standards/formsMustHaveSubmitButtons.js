module.exports = {
  name: 'Forms must have submit buttons',

  validate: function($, fail) {
    $("form").each(function(index, form) {
      var submits = $(form).find("input[type=submit], button[type=submit]");
      if (submits.length == 0) {
        fail('Form has no submit button:', form);
      }
    });
  }
}
