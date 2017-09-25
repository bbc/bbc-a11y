module.exports = {
  name: 'Title attributes only on inputs',

  type: 'automated',

  failsForEach: 'element that is not an input (input, button, textarea, select) ' +
                'or iframe, but does have a title attribute',

  test: function ({ $, fail }) {
    $('[title]:not(input, button, textarea, select, iframe):visible').each(function (index, element) {
      fail('Non-input element has title attribute:', element)
    })
  }
}
