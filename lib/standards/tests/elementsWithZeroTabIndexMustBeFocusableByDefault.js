module.exports = {
  name: 'Zero tab index must only be set on elements which are focusable by default',

  type: 'automated',

  failsForEach: 'element that is not focusable by default (input, button, select, textarea, a)' +
                ' and has a tabindex attribute set to 0',

  test: function ({ $, fail }) {
    var baddies = $("*[tabindex='0']:visible:not(input, button, select, textarea, a)")
    baddies.each(function (index, el) {
      fail('Non-focusable element with tabindex=0:', el)
    })
  }
}
