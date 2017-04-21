var jquery = require('jquery');
var standards = require('./standards');

window.a11y = {
  test: function(pageConfiguration, finder) {
    return standards
      .matching(pageConfiguration)
      .test(finder || jquery, pageConfiguration || {})
  }
};

module.exports = window.a11y;
