var headingSelector = 'h1, h2, h3, h4, h5, h6, h7, h8';

module.exports = {
  name: 'Content must follow headings',

  validate: function($, fail) {
    $(headingSelector).each(function(index, heading) {
      if ($(heading.nextSibling).is(headingSelector) ||
         ($(heading.nextSibling).text().trim() == '' &&
          $(heading).next().is(headingSelector))) {
        fail("No content follows:", heading);
      }
    });
  }
}
