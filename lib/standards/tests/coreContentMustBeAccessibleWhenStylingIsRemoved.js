module.exports = {
  name: 'Core content must be accessible when styling is removed',

  type: 'manual',

  failsForEach: 'page that requires styling to be accessible',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    if (typeof require === 'function') {
      window.top.launchNoStyleWindow = function () {
        var electron = require('electron')
        var currentWindow = electron.remote.getCurrentWindow()
        var BrowserWindow = electron.remote.BrowserWindow
        var simpleWindow = new BrowserWindow({ parent: currentWindow, offscreen: true })
        simpleWindow.loadURL(pageConfiguration.url)
        simpleWindow.webContents.executeJavaScript("Array.from(document.querySelectorAll('link[rel=\"stylesheet\"], style')).forEach(elem => elem.parentNode.removeChild(elem))")
      }
      return ask('Is the core content of the page readable and usable <a href="javascript:window.top.launchNoStyleWindow()">without styling/CSS</a>?')
        .catch(function (error) {
          fail(error)
        })
    }
  }
}
