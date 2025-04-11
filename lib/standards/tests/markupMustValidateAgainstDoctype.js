const httpism = require('httpism')

module.exports = {
  name: 'Markup must validate against doctype',

  type: 'automated',

  failsForEach: 'page whose markup does not validate against a w3c standards validator',

  test: function ({ $, fail, warn, pageConfiguration }) {
    if (typeof pageConfiguration.w3cValidator === 'undefined') { return Promise.resolve() }
    const doc = $('html')[0].ownerDocument
    if (doc.doctype) {
      const getDocTypeAsString = function () {
        const node = doc.doctype
        return node
          ? '<!DOCTYPE ' +
               node.name +
               (node.publicId ? ' PUBLIC "' + node.publicId + '"' : '') +
               (!node.publicId && node.systemId ? ' SYSTEM' : '') +
               (node.systemId ? ' "' + node.systemId + '"' : '') +
               '>\n'
          : ''
      }

      const html = getDocTypeAsString() + doc.documentElement.outerHTML
      const options = {
        response: true,
        headers: {
          'user-agent': 'bbc-a11y',
          accept: 'application/json',
          'content-type': 'text/html'
        }
      }
      return httpism.post(pageConfiguration.w3cValidator + '?out=json', html, options)
        .then(function (response) {
          response.body.messages.forEach(function (w3cMessage) {
            let a11yMessage = w3cMessage.message
            if (w3cMessage.extract) a11yMessage += ' ' + w3cMessage.extract
            if (w3cMessage.type === 'error') { fail(a11yMessage) } else { warn(a11yMessage) }
          })
        })
        .catch(function (error) {
          fail('Error calling w3c validator:' + error.message)
        })
    }
  }
}
