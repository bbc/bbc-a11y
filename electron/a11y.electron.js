const electron = require('electron')
const app = electron.app
app.commandLine.appendSwitch('--disable-http-cache')

const BrowserWindow = electron.BrowserWindow

const path = require('path')
const url = require('url')
const commandLineArgs = require('../lib/commandLineArgs').parse(process.argv)

let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow({
    width: 1024,
    height: 800,
    show: false,
    webPreferences: { webSecurity: false }
  })

  mainWindow.loadURL(url.format({
    pathname: path.join(__dirname, 'index.html'),
    protocol: 'file:',
    slashes: true
  }))

  mainWindow.webContents.openDevTools({ mode: 'bottom' })

  mainWindow.webContents.on('devtools-opened', () => {
    setImmediate(() => {
      if (commandLineArgs.interactiveMode) {
        mainWindow.show()
      }
    })
  })

  mainWindow.webContents.session.webRequest.onHeadersReceived({}, function (d, c) {
    if(d.responseHeaders['X-Frame-Options']){
      delete d.responseHeaders['X-Frame-Options'];
    }
    c({ cancel: false, responseHeaders: d.responseHeaders })
  })

  mainWindow.on('closed', function () {
    mainWindow.removeAllListeners();
    mainWindow = null
  })
}

app.on('ready', createWindow)

// Quit when all windows are closed.
app.on('window-all-closed', function () {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', function () {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow()
  }
})
