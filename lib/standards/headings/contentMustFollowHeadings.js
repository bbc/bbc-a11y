var headingSelector = 'h1, h2, h3, h4, h5, h6, h7, h8'

module.exports = {
  name: 'Content must follow headings',

  test: function ({ $, fail }) {
    function ancestorsNextSibling (element) {
      return $(element).parents().filter(
        function () { return this.nextSibling }
      ).map(function () { return this.nextSibling })[0]
    }

    $(headingSelector).each(function (index, heading) {
      var nextNode = heading.nextSibling || ancestorsNextSibling(heading)
      while (nextNode) {
        if ($(nextNode).is(heading.tagName)) { break }
        if ($(nextNode).text().trim().length > 0) { return }
        nextNode = nextNode.nextSibling
                   ? nextNode.nextSibling : (nextNode.parentNode && nextNode.parentNode.nextSibling)
      }
      fail('No content follows:', heading)
    })
  }
}
