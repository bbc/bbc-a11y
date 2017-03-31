var jquery = require('jquery');
var standards = require('./standards');

window.a11y = {
  validate: function(pageConfiguration, finder) {
    return standards.matching(pageConfiguration).validate(finder || jquery, pageConfiguration || {});
  }
};

module.exports = window.a11y;
