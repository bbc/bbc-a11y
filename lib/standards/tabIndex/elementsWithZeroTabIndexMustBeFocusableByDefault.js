module.exports = {
  name: 'Zero Tab index must only be set on elements which are focusable by default',

  test: function ({ $, fail }) {
    var baddies = $("*[tabindex='0']:visible:not(input, button, select, textarea, a)")
    baddies.each(function (index, el) {
      fail('Non-focusable element with tabindex=0:', el)
    })
  }
}
