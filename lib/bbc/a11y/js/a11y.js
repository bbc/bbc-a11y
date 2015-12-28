var jquery = require('jquery');
var standards = require('./standards');

window.a11y = {
  validate: function(pattern) {
    return standards.matching(pattern).validate(jquery);
  }
};

module.exports = window.a11y;
