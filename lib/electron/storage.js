module.exports = {
  clear: function () {
    const electronRemote = require('electron').remote

    const session = electronRemote.session.defaultSession
    return session.clearStorageData()
  }
}
