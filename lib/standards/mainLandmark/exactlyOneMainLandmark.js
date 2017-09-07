module.exports = {
  name: 'Exactly one Main landmark',

  test: function ({ $, fail }) {
    var mainLandmarks = $("[role='main']")
    var count = mainLandmarks.length
    if (count === 0) {
      fail('Found 0 elements with role="main".')
    } else if (count > 1) {
      fail('Found ' + count + ' elements with role="main":', mainLandmarks)
    }
  }
}
