module.exports = {
  name: 'Text cannot be too small',

  type: 'automated',

  failsForEach: 'text node with a computed font size of less than 11px',

  test: function ({ $, fail }) {
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

    for (let i = 0; i < parents.length; ++i) {
      const element = $(parents[i])
      const size = fontSizeOf(element)
      if (size < 11 && size !== fontSizeOf(element.parent())) {
        fail('Text size too small (' + size + 'px):', element)
      }
    }
  }
}

function fontSizeOf (element) {
  return Number(element.css('fontSize').replace('px', ''))
}
