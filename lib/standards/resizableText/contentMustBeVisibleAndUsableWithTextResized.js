module.exports = {
  name: 'Content must be visible and usable with text resized to 200% of normal',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    var textResizedWindow
    function closeWindow () {
      if (textResizedWindow) {
        try {
          textResizedWindow.close()
        } catch (e) {

        }
      }
    }

    if (typeof require === 'function') {
      window.top.launchTextResizedWindow = function () {
        var electron = require('electron')
        var currentWindow = electron.remote.getCurrentWindow()
        var BrowserWindow = electron.remote.BrowserWindow
        textResizedWindow = new BrowserWindow({ parent: currentWindow, offscreen: true })
        textResizedWindow.loadURL(pageConfiguration.url)
        textResizedWindow.webContents.executeJavaScript('window.document.body.style.fontSize = "200%"')
      }

      return ask('Is the content visible and usable with the <a href="javascript:window.top.launchTextResizedWindow()">text resized to 200% of normal</a>?')
        .then(function () {
          closeWindow()
        })
        .catch(function (error) {
          closeWindow()
          fail(error)
        })
    }
  }
}
