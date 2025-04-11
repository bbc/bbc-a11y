module.exports = {
  name: 'Elements must be visible on focus',

  type: 'automated',

  failsForEach: '<a> element that is hidden after receiving focus',

  test: function ({ $, fail }) {
    $('a:visible').each(function (index, element) {
      const $element = $(element)
      $element.focus()
      const offset = $element.offset()
      const visible = offset.top + $element.height() > 0 &&
                    offset.left + $element.width() > 0
      if (!visible) {
        fail('Element is invisible on focus:', element)
      }
    })
    $(document).scrollTop(0)
  }
}
