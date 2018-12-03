module.exports = {
  name: 'Title attributes only on inputs',

  type: 'automated',

  failsForEach: 'element that is not an input (input, button, textarea, select), ' +
                'iframe, or abbreviation but does have a title attribute',

  test: function ({ $, fail }) {
    $('[title]:not(input, button, textarea, select, iframe, abbr):visible').each(function (index, element) {
      fail('Non-input element has title attribute:', element)
    })
  }
}
