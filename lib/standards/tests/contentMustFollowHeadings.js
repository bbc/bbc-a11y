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

    function isSameAsHeading ($node, heading) {
      return $node.is(heading.tagName);
    }

    function nodeHasChildren($node) {
      return $node.children().length > 0;
    }

    function firstChildNodeIsNotSameAsHeading($node, heading) {
      return !isSameAsHeading($($node.children()[0]), heading);
    }

    function thereIsContentBeforeNextHeading (heading) {
      var thereIsContent = false
      getNodesUntilNextHeading(heading).forEach(function (node) {
        if (thereIsContent) return
        else if (nodeHasChildren($(node))) {
          thereIsContent = firstChildNodeIsNotSameAsHeading($(node), heading)
        }
        else {
          thereIsContent = nodeHasText($(node))
        }
      });
      return thereIsContent
    }

    function getNodesUntilNextHeading(heading) {
      var nodesUntilNextHeading = [];
      var nextNode = getNextNode(heading)
      while (nextNode) {
        nextNode = getNextNode(nextNode)
        if (nextNode && !isSameAsHeading($(nextNode), heading)) {
          nodesUntilNextHeading.push(nextNode)
        }
        else {
          nextNode = false
        }
      }

      /**
       * Special case: handling HTML that isn't inside Nodes, eg
       * 
       * <h2>Heading</h2> some content <h2>another heading</h2>
       * 
       * This block of code handles the 'some content' scenario
       */
      var unwrappedNodes = []
      var nextLevelUp = heading.parentNode
      while (unwrappedNodes.length === 0) {
        unwrappedNodes = $(nextLevelUp).contents().filter(function() {
          return this.nodeType == Node.TEXT_NODE;
        });
        if (nextLevelUp.parentNode) {
          nextLevelUp = nextLevelUp.parentNode;
        }
      }

      return [...nodesUntilNextHeading, ...unwrappedNodes];
    }

    function getNextNode(node) {
      return node.nextSibling || ancestorsNextSibling(node)
    }

    $(headingSelector).each(function (_index, heading) {
      return thereIsContentBeforeNextHeading(heading)
        ? true : fail('No content follows:', heading)
    })
  }
}
