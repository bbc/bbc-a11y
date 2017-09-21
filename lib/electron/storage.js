module.exports = {
  clear: function () {
    const session = require('electron').remote.session.defaultSession
    return new Promise(function (resolve, reject) {
      session.clearStorageData({}, function (err) {
        if (err) {
          reject(err)
        } else {
          resolve()
        }
      })
    })
  }
}
