module.exports = {
  name: 'All documents must have a W3C recommended doctype',

  test: function ({ $, fail }) {
    if (!$('html')[0].ownerDocument.doctype) {
      fail('Missing w3c recommended doctype')
    }
  }
}
