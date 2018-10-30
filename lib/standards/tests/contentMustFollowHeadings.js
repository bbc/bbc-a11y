var headingSelector = 'h1, h2, h3, h4, h5, h6, h7, h8'

module.exports = {
  name: 'Content must follow headings',

  type: 'automated',

  failsForEach: 'heading element (<h1> up to <h8>) that has no text content after it. ' +
                'Text elements may appear as children or descendants of subsequent siblings',

  test: function ({ $, fail }) {
    function ancestorsNextSibling (element) {
      return $(element).parents().filter(
        function () { return this.nextSibling }
      ).map(function () { return this.nextSibling })[0]
    }

    function nodeHasText ($node) {
      return $node.text().trim().length > 0
    }

    function isHeading ($node) {
      return $node.is(headingSelector);
    }

    function getNextRealNode (heading) {
      return $(heading.nextSibling || ancestorsNextSibling(heading))
    }

    function nextRealNodeIsNotHeading (heading) {
      var $node = getNextRealNode(heading)
      return !isHeading($node)
    }

    function nextRealNodeHasContent (heading) {
      var $node = getNextRealNode(heading)
      return nodeHasText($node)
    }

    $(headingSelector).each(function (_index, heading) {
      return nextRealNodeIsNotHeading(heading) && nextRealNodeHasContent(heading)
        ? true : fail('No content follows:', heading)
    })
  }
}
