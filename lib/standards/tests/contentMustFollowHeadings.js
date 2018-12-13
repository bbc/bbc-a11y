var headingSelector = 'h1, h2, h3, h4, h5, h6'
var iframeSelector = 'iframe:visible'

var NODE_IS_FINE = 'node-is-fine'
var NODE_IS_BAD = 'node-is-bad'

module.exports = {
  name: 'Content must follow headings',

  type: 'automated',

  failsForEach: 'heading element (<h1> up to <h6>) that has no text content after it. ' +
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

    function checkNextNode (heading, $nextNode) {
      var $nextIframesNodes = $nextNode.is(iframeSelector) ? $nextNode : $nextNode.find(iframeSelector)
      var $nextIframesNodesBody = $nextIframesNodes.contents().find('body')

      if ($nextNode.is(heading.tagName)) {
        return NODE_IS_BAD
      }
      if (nodeHasText($nextNode) || nodeHasText($nextIframesNodesBody)) {
        return NODE_IS_FINE
      }
    }

    $(headingSelector).each(function (index, heading) {
      var nextNode = heading.nextSibling || ancestorsNextSibling(heading)
      while (nextNode) {
        var $nextNode = $(nextNode)
        var nodeStatus
        if (nodeHasText($nextNode)) {
          $nextNode.children().each(function (index, child) {
            nodeStatus = checkNextNode(heading, $(child))
            if (nodeStatus) {
              return false
            }
          })
        }
        if (!nodeStatus) {
          nodeStatus = checkNextNode(heading, $nextNode)
        }
        if (nodeStatus === NODE_IS_FINE) {
          return
        }
        if (nodeStatus === NODE_IS_BAD) {
          break
        }
        nextNode = nextNode.nextSibling
          ? nextNode.nextSibling : (nextNode.parentNode && nextNode.parentNode.nextSibling)
      }
      fail('No content follows:', heading)
    })
  }
}
