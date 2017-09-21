module.exports = {
  name: 'Title attributes only on inputs',

  test: function ({ $, fail }) {
    $('[title]:not(input, button, textarea, select, iframe):visible').each(function (index, element) {
      fail('Non-input element has title attribute:', element)
    })
  }
}
