var headingSelector = 'h1, h2, h3, h4, h5, h6, h7, h8';

module.exports = {
  name: 'Content must follow headings',

  validate: function($, fail) {
    $(headingSelector).each(function(index, heading) {
      var nextSibling = heading.nextSibling;
      while (nextSibling) {
        if ($(nextSibling).is(heading.tagName)) { break; }
        if ($(nextSibling).text().trim().length > 0) { return; }
        nextSibling = nextSibling.nextSibling ?
                      nextSibling.nextSibling : nextSibling.parentNode;
      }
      fail("No content follows:", heading);
    });
  }
}
