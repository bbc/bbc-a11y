module.exports = {
  name: 'Exactly one main heading',

  validate: function($, fail) {
    var mainHeadings = $('h1');
    var count = mainHeadings.length;
    if (count == 0) {
      fail('Found 0 h1 elements.');
    } else if (count > 1) {
      fail('Found ' + count + ' h1 elements:', mainHeadings);
    }
  }
}
