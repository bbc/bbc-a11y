module.exports = {
  name: 'Content must be visible and usable with page zoomed to 200% of normal',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    if (typeof require === 'function') {
      window.top.launchZoomedWindow = function () {
        var electron = require('electron')
        var currentWindow = electron.remote.getCurrentWindow()
        var BrowserWindow = electron.remote.BrowserWindow
        var simpleWindow = new BrowserWindow({ parent: currentWindow, offscreen: true })
        simpleWindow.loadURL(pageConfiguration.url)
        simpleWindow.webContents.setZoomLevel(2)
      }
      return ask('Is the content visible and usable with the page <a href="javascript:window.top.launchZoomedWindow()">zoomed to 200% of normal</a>?')
        .catch(function (error) {
          fail(error)
        })
    }
  }
}
