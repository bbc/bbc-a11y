module.exports = {
  name: 'All documents must have a W3C recommended doctype',

  type: 'automated',

  failsForEach: 'page that is missing a w3c recommended doctype (e.g. <!DOCTYPE html>)',

  test: function ({ fail }) {
    if (!document.doctype) {
      fail('Missing w3c recommended doctype')
    }
  }
}
