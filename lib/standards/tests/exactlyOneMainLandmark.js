module.exports = {
  name: 'Exactly one main landmark',

  type: 'automated',

  failsForEach: 'page with no landmark element (any element with role="main")',

  topFrameOnly: true,

  test: function ({ $, fail }) {
    var mainLandmarks = $("main,[role='main']")
    var count = mainLandmarks.length
    if (count === 0) {
      fail('Found 0 main elements (main or with role="main").')
    } else if (count > 1) {
      fail('Found ' + count + ' main elements (main or with role="main"):', mainLandmarks)
    }
  }
}
