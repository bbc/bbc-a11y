var headingSelector = 'h1, h2, h3, h4, h5, h6, h7, h8'
var iframeSelector = 'iframe:visible'

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

    function nodeHasContent ($node) {
      return $node.text().trim().length > 0
    }

    $(headingSelector).each(function (index, heading) {
      var nextNode = heading.nextSibling || ancestorsNextSibling(heading)
      while (nextNode) {
        var $nextNode = $(nextNode)
        var $nextIframesNodes = $(nextNode).is(iframeSelector) ? $(nextNode) : $(nextNode).find(iframeSelector)
        var $nextIframesNodesBody = $nextIframesNodes.contents().find('body')
        if ($nextNode.is(heading.tagName)) { break }
        if (nodeHasContent($nextNode) || nodeHasContent($nextIframesNodesBody)) { return }
        nextNode = nextNode.nextSibling
          ? nextNode.nextSibling : (nextNode.parentNode && nextNode.parentNode.nextSibling)
      }
      fail('No content follows:', heading)
    })
  }
}
