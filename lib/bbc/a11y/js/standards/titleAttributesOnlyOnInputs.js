module.exports = {
  name: 'Title attributes only on inputs',

  validate: function($, fail) {
    $("[title]:not(input, button, textarea, select)").each(function(index, element) {
      fail('Non-input element has title attribute:', element);
    });
  }
}
