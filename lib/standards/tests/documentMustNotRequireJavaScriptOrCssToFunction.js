module.exports = {
  name: 'Document must not require JavaScript or CSS to function',

  type: 'manual',

  failsForEach: 'page that requires JavaScript or CSS to function',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    if (typeof require === 'function') {
      window.top.launchSimpleWindow = function () {
        const electronRemote = require('electron').remote
        const currentWindow = electronRemote.getCurrentWindow()
        const BrowserWindow = electronRemote.BrowserWindow
        const simpleWindow = new BrowserWindow({
          parent: currentWindow,
          javascript: false,
          offscreen: true,
          webPreferences: {
            webSecurity: false,
            enableRemoteModule: true,
            contextIsolation: false,
            nodeIntegration: true
          }
        })
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
