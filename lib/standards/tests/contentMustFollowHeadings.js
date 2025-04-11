const headingSelector = 'h1, h2, h3, h4, h5, h6, h7, h8'
const iframeSelector = 'iframe:visible'

const NODE_IS_FINE = 'node-is-fine'
const NODE_IS_BAD = 'node-is-bad'

module.exports = {
  name: 'Content must follow headings',

  type: 'automated',

  failsForEach: 'heading element (<h1> up to <h8>) that has no text content after it. ' +
                'Text elements may appear as children or descendants of subsequent siblings',

  test: ({ $, fail }) => {
    function ancestorsNextSibling(element) {
      return $(element).parents().filter(
        function() { return this.nextSibling }
      ).map(function() { return this.nextSibling })[0]
    }

    function nodeHasText($node) {
      return $node.text().trim().length > 0
    }

    function checkNextNode(heading, $nextNode) {
      const $nextIframesNodes = $nextNode.is(iframeSelector) ? $nextNode : $nextNode.find(iframeSelector)
      const $nextIframesNodesBody = $nextIframesNodes.contents().find('body')

      if ($nextIframesNodes.length > 0 && $nextIframesNodes.filter('[src]').length > 0) {
        return NODE_IS_FINE
      }

      if ($nextNode.is(heading.tagName)) {
        return NODE_IS_BAD
      }
      
      if (nodeHasText($nextNode) || nodeHasText($nextIframesNodesBody)) {
        return NODE_IS_FINE
      }
    }

    $(headingSelector).each((index, heading) => {
      let nextNode = heading.nextSibling || ancestorsNextSibling(heading)
      let $nextNode
      let nodeStatus

      while (nextNode) {
        $nextNode = $(nextNode)
        nodeStatus = undefined
        
        if (nodeHasText($nextNode)) {
          $nextNode.children().each((index, child) => {
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
          ? nextNode.nextSibling : (nextNode.parentNode?.nextSibling)
      }
      
      fail('No content follows:', heading)
    })
  }
}
