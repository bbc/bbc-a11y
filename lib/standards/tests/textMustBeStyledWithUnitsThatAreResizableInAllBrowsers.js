module.exports = {
  name: 'Text must be styled with units that are resizable in all browsers',

  type: 'automated',

  failsForEach: 'text node that descends from an element styled with a px unit',

  test: function ({ $, fail }) {
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

    var temporaryStyleTag = document.createElement('style')
    temporaryStyleTag.innerText = '* { font-size: 666px }'
    $('head')[0].appendChild(temporaryStyleTag)
    for (var i = 0; i < parents.length; ++i) {
      var element = $(parents[i])
      var fontSize = element.css('fontSize')
      if (fontSize.indexOf('px') > -1 && fontSize !== '666px') {
        fail('Text styled with px unit:', element)
      }
    }
    $(temporaryStyleTag).remove()
  }
}
