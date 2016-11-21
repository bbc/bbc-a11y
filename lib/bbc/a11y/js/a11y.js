var jquery = require('jquery');
var standards = require('./standards');

window.a11y = {
  validate: function(pattern, finder) {
    return standards.matching(pattern).validate(finder || jquery);
  }
};

module.exports = window.a11y;
