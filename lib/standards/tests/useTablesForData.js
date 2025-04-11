const detectTableType = require('./support/detectTableType')

module.exports = {
  name: 'Use tables for data',

  type: 'automated',

  failsForEach: '<table> that is used to apply layout, rather than to display data',

  test: function ({ $, fail }) {
    $('table').each(function () {
      if (detectTableType(this) === 'layout') {
        fail('Table used for layout:', this)
      }
    })
    $(':not(table)').each(function () {
      if ($(this).css('display') === 'table') {
        fail('Table used for layout:', this)
      }
    })
  }
}
