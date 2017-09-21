var detectTableType = require('../../detectTableType')

module.exports = {
  name: 'Use tables for data',

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
