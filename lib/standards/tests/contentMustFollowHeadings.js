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

    function nodeHasText ($node) {
      return $node.text().trim().length > 0
    }

    function checkNextNode(heading, $nextNode) {
      var $nextIframesNodes = $nextNode.is(iframeSelector) ? $nextNode : $nextNode.find(iframeSelector)
      var $nextIframesNodesBody = $nextIframesNodes.contents().find('body')
      if ($nextNode.is(heading.tagName)) {
        return 'error';
      }
      if (nodeHasText($nextNode) || nodeHasText($nextIframesNodesBody)) {
        return 'all-good';
      }
    }

    $(headingSelector).each(function (index, heading) {
      var nextNode = heading.nextSibling || ancestorsNextSibling(heading)
      while (nextNode) {
        var $nextNode = $(nextNode)
        var anyGood
        if (nodeHasText($nextNode)) {
          $nextNode.children().each(function (index, child) {
            anyGood = checkNextNode(heading, $(child))
            if (anyGood) {
              return false
            }
          });
        }
        if (!anyGood) {
          anyGood = checkNextNode(heading, $nextNode)
        }
        if (anyGood === 'all-good') {
          return
        }
        if (anyGood === 'error') {
          break
        }
        nextNode = nextNode.nextSibling
          ? nextNode.nextSibling : (nextNode.parentNode && nextNode.parentNode.nextSibling)
      }
      fail('No content follows:', heading)
    })
  }
}
