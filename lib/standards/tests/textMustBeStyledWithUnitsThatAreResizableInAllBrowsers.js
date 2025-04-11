module.exports = {
  name: 'Text must be styled with units that are resizable in all browsers',

  type: 'automated',

  failsForEach: 'text node that descends from an element styled with a px unit',

  test: function ({ $, fail }) {
    const disallowedUnits = ['px', 'pt', 'cm', 'mm', 'in', 'pc']
    const textNodes = $('*:not(head, script, style):visible').contents().filter(function () {
      return this.nodeType === 3 && this.textContent.trim().length > 0
    })

    const parents = []
    textNodes.each(function (index, node) {
      const parent = $(node).parent()[0]
      if (parents.indexOf(parent) === -1) {
        parents.push(parent)
      }
    })

    for (const parentIndex in parents) {
      const element = $(parents[parentIndex])
      const fontSizes = getElementFontSizes(element)

      for (const disallowedUnitIndex in disallowedUnits) {
        const disallowedUnit = disallowedUnits[disallowedUnitIndex]
        if (fontSizesIncludeUnit(fontSizes, disallowedUnit)) {
          fail('Text styled with ' + disallowedUnit + ' unit:', element)
        }
      }
    }
  }
}

function getElementFontSizes (el) {
  const sheets = el[0].ownerDocument.styleSheets
  const fontSizes = []
  for (const sheetIndex in sheets) {
    const rules = sheets[sheetIndex].rules || sheets[sheetIndex].cssRules
    for (const ruleIndex in rules) {
      const fontSize = rules[ruleIndex].style && rules[ruleIndex].style['font-size']
      const matchingElements = document.querySelectorAll(rules[ruleIndex].selectorText)
      const ruleMatches = [].slice.apply(matchingElements).includes(el[0]) || el[0].closest(rules[ruleIndex].selectorText)

      if (fontSize && ruleMatches) {
        fontSizes.push(rules[ruleIndex].style['font-size'])
      }
    }
  }
  const inlineStyle = el[0].style && el[0].style.fontSize
  if (inlineStyle) {
    fontSizes.push(inlineStyle)
  }
  return fontSizes
}

function fontSizesIncludeUnit (sizes, unit) {
  for (const sizeIndex in sizes) {
    const size = sizes[sizeIndex]
    if (new RegExp('[0-9.]+' + unit).test(size)) {
      return true
    }
  }
  return false
}
