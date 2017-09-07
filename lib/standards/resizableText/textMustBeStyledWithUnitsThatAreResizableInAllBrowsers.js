module.exports = {
  name: 'Text must be styled with units that are resizable in all browsers',

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

    var temporaryStyle = $('head').append('<style>* { font-size: 666px }</style>')
    for (var i = 0; i < parents.length; ++i) {
      var element = $(parents[i])
      var fontSize = element.css('fontSize')
      if (fontSize.indexOf('px') > -1 && fontSize != '666px') {
        fail('Text styled with px unit:', element)
      }
    }
    temporaryStyle.remove()
  }
}
