module.exports = {
  name: 'Text cannot be too small',

  validate: function($, fail) {
    var textNodes = $('*:not(head, script, style):visible').contents().filter(function() {
      return this.nodeType === 3 && this.textContent.trim().length > 0;
    });

    var parents = [];
    textNodes.each(function(index, node) {
      var parent = $(node).parent()[0];
      if (parents.indexOf(parent) == -1) {
        parents.push(parent);
      }
    });

    for (var i = 0; i < parents.length; ++i) {
      var element = $(parents[i]);
      var size = parseInt(element.css('fontSize').replace('px', ''), 10);
      if (size < 11) {
        fail('Text size too small (' + size + 'px):', element);
      }
    }
  }
}
