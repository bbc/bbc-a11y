module.exports = {
  name: 'Exactly one main heading',

  type: 'automated',

  failsForEach: 'visible <h1> element except the very first one',

  topFrameOnly: true,

  test: function ({ $, fail }) {
    const mainHeadings = $('h1:visible')
    const count = mainHeadings.length
    if (count === 0) {
      fail('Found 0 h1 elements.')
    } else if (count > 1) {
      fail('Found ' + count + ' h1 elements:', mainHeadings)
    }
  }
}
