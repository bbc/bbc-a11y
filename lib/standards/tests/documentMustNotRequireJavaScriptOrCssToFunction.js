module.exports = {
  name: 'Document must not require JavaScript or CSS to function',

  type: 'manual',

  failsForEach: 'page that requires JavaScript or CSS to function',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    if (typeof require === 'function') {
      window.top.launchSimpleWindow = function () {
        require('@electron/remote/main').initialize();
        var electronRemote = require('@electron/remote');
        var currentWindow = electronRemote.getCurrentWindow();
        var BrowserWindow = electronRemote.BrowserWindow;
        var simpleWindow = new BrowserWindow({
          parent: currentWindow,
          javascript: false,
          offscreen: true,
        });
        require('@electron/remote/main').enable(mainWindow);
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
