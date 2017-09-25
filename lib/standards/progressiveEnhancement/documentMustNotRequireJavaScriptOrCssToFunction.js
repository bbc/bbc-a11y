module.exports = {
  name: 'Document must not require JavaScript or CSS to function',

  type: 'manual',

  failsForEach: 'page that requires JavaScript or CSS to function',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    if (typeof require === 'function') {
      window.top.launchSimpleWindow = function () {
        var electron = require('electron')
        var currentWindow = electron.remote.getCurrentWindow()
        var BrowserWindow = electron.remote.BrowserWindow
        var simpleWindow = new BrowserWindow({ parent: currentWindow, javascript: false, offscreen: true })
        simpleWindow.loadURL(pageConfiguration.url)
        simpleWindow.webContents.executeJavaScript("Array.from(document.querySelectorAll('link[rel=\"stylesheet\"], style')).forEach(elem => elem.parentNode.removeChild(elem))")
      }
      return ask('Does the page function <a href="javascript:window.top.launchSimpleWindow()">without JavaScript or CSS</a>?')
        .catch(function (error) {
          fail(error)
        })
    }
  }
}
