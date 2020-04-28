module.exports = {
  name: 'Exactly one main heading',

  type: 'automated',

  failsForEach: 'visible <h1> element except the very first one',

  test: function ({ $, fail }) {
    var mainHeadings = $('h1:visible')
    var count = mainHeadings.length
    if (count === 0) {
      fail('Found 0 h1 elements.')
    } else if (count > 1) {
      console.log('xxxx')
      fail('Found ' + count + ' h1 elements:', mainHeadings)
    }
  }
}
