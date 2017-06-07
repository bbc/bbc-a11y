module.exports = {
  name: 'Text must be styled with units that are resizable in all browsers',

  test: function ($, fail) {
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

    for (var i = 0; i < parents.length; ++i) {
      var element = $(parents[i])
      if (element.css('fontSize').indexOf('px') > -1) {
        fail('Text styled with px unit:', element)
      }
    }
  }
}
