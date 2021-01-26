module.exports = {
  name: 'Exactly one main landmark',

  type: 'automated',

  failsForEach: 'page with no main landmark element (<main> tag or any element with role="main")',

  topFrameOnly: true,

  test: function ({ $, fail }) {
    var mainLandmarks = $("[role='main'], main")
    var count = mainLandmarks.length
    if (count === 0) {
      fail('Found 0 elements with <main> tag or role="main".')
    } else if (count > 1) {
      fail('Found ' + count + ' elements with <main> tag or role="main":', mainLandmarks)
    }
  }
}
