var httpism = require('httpism')

module.exports = {
  name: 'Markup must validate against doctype',

  test: function($, fail, warn) {
    var doc = $('html')[0].ownerDocument
    if (doc.doctype) {

      var getDocTypeAsString = function () {
          var node = doc.doctype;
          return node ? "<!DOCTYPE "
               + node.name
               + (node.publicId ? ' PUBLIC "' + node.publicId + '"' : '')
               + (!node.publicId && node.systemId ? ' SYSTEM' : '')
               + (node.systemId ? ' "' + node.systemId + '"' : '')
               + '>\n' : '';
      };

      var html = getDocTypeAsString() + doc.documentElement.outerHTML
      var options = {
        response: true,
        headers: {
          'user-agent': 'bbc-a11y',
          'accept': 'application/json',
          'content-type': 'text/html'
        }
      }
      return httpism.post('https://validator.w3.org/nu/?out=json', html, options)
        .then(function(response) {
          response.body.messages.forEach(function (message) {
            if (message.type == 'error')
              fail(message.message)
            else
              warn(message.message)
          })
        })
        .catch(function(error) {
          fail('Error calling w3c validator:' + error.message)
        })
    }
  }
}
