module.exports = {
  name: 'Content must be visible and usable with page zoomed to 200% of normal',

  type: 'manual',

  failsForEach: 'page whose content is not visible or is not usable when zoomed to 200% of normal',

  topFrameOnly: true,

  test: function ({ $, fail, warn, pageConfiguration, ask }) {
    if (typeof require === 'function') {
      window.top.launchZoomedWindow = function () {
        var electronRemote = require('electron').remote;
        var currentWindow = electronRemote.getCurrentWindow();
        var BrowserWindow = electronRemote.BrowserWindow;
        var simpleWindow = new BrowserWindow({
          parent: currentWindow,
          offscreen: true,
          webPreferences: {
            webSecurity: false,
            enableRemoteModule: true, 
            contextIsolation: false,
            nodeIntegration: true,
          },
        });
        simpleWindow.loadURL(pageConfiguration.url);
        simpleWindow.webContents.setZoomLevel(2);
      };
      return ask('Does the content scale when <a href="javascript:window.top.launchZoomedWindow()">zoom</a> or pinch-zoom is used?')
        .catch(function (error) {
          fail(error)
        })
    }
  }
}
