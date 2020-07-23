module.exports = {
  name: 'Exactly one main landmark',

  type: 'automated',

  failsForEach: 'page with no landmark element (any element with role="main")',

  topFrameOnly: true,

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
