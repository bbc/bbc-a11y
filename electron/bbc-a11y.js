const electron = require('electron')
const app = electron.app
app.commandLine.appendSwitch('--disable-http-cache')
app.commandLine.appendSwitch('disable-site-isolation-trials');

const BrowserWindow = electron.BrowserWindow

const path = require('path')
const url = require('url')
const commandLineArgs = require('../lib/cli/args').parse(process.argv)

let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow({
    width: commandLineArgs.width || 1024,
    height: 800,
    show: false,
    webPreferences: { webSecurity: false, nodeIntegration: true }
  })

  mainWindow.loadURL(url.format({
    pathname: path.join(__dirname, 'index.html'),
    protocol: 'file:',
    slashes: true
  }))

  if (commandLineArgs.manual) {
    mainWindow.show()
  } else {
    mainWindow.webContents.openDevTools({ mode: 'bottom' })
  }

  mainWindow.webContents.on('devtools-opened', () => {
    setImmediate(() => {
      if (commandLineArgs.interactive) {
        mainWindow.show()
      }
    })
  })

  mainWindow.webContents.session.webRequest.onHeadersReceived(function (d, c) {
    for (var header in d.responseHeaders) {
      if (header.toLowerCase() === 'x-frame-options') {
        delete d.responseHeaders[header]
      }
    }
    c({ cancel: false, responseHeaders: d.responseHeaders })
  })

  mainWindow.on('closed', function () {
    mainWindow.removeAllListeners()
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
