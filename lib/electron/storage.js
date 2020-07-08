module.exports = {
  clear: function () {
    const session = require('electron').remote.session.defaultSession
    return session.clearStorageData()
  }
}
