module.exports = {
  name: 'Text must be styled with units that are resizable in all browsers',

  type: 'automated',

  failsForEach: 'text node that descends from an element styled with a px unit',

  test: function ({ $, fail }) {
    var disallowedUnits = ['px', 'pt'];
    var textNodes = $('*:not(head, script, style):visible').contents().filter(function () {
      return this.nodeType === 3 && this.textContent.trim().length > 0
    })

    var parents = []
    textNodes.each(function (index, node) {
      var parent = $(node).parent()[0]
      if (parents.indexOf(parent) === -1) {
        parents.push(parent)
      }
    })

    for (var parentIndex in parents) {
      var element = $(parents[parentIndex])
      var fontSizes = getElementFontSizes(element)

      for (var disallowedUnitIndex in disallowedUnits) {
        var disallowedUnit = disallowedUnits[disallowedUnitIndex]
        if (fontSizesIncludeUnit(fontSizes, disallowedUnit)) {
          fail('Text styled with ' + disallowedUnit + ' unit:', element)
        }
      }
    }
  }
}

function getElementFontSizes (el) {
  var sheets = el[0].ownerDocument.styleSheets
  var fontSizes = []
  for (var sheetIndex in sheets) {
    var rules = sheets[sheetIndex].rules || sheets[sheetIndex].cssRules
    for (var ruleIndex in rules) {
      var fontSize = rules[ruleIndex].style && rules[ruleIndex].style['font-size']
      var ruleMatches = el.is(rules[ruleIndex].selectorText) || el.closest(rules[ruleIndex].selectorText).length
      if (fontSize && ruleMatches) {
        fontSizes.push(rules[ruleIndex].style['font-size'])
      }
    }
  }
  var inlineStyle = el[0].style && el[0].style.fontSize
  if (inlineStyle) {
    fontSizes.push(inlineStyle)
  }
  return fontSizes
}

function fontSizesIncludeUnit (sizes, unit) {
  for (var sizeIndex in sizes) {
    var size = sizes[sizeIndex]
    if (size.indexOf(unit) > -1) {
      return true
    }
  }
  return false
}
