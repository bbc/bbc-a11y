var jquery = require('jquery')
var standards = require('./standards')

window.a11y = {
  test: function (pageConfiguration, finder, ask) {
    return standards
      .matching(pageConfiguration)
      .test(
        finder || jquery,
        pageConfiguration || {},
        ask || function () {
          return Promise.resolve()
        }
      )
  }
}

module.exports = window.a11y
