module.exports = {
  set: function ({ url, cookies }) {
    const session = require('electron').remote.session.defaultSession
    return Promise.all((cookies || []).map(function (cookie) {
      return new Promise(function (resolve, reject) {
        var cookieValue = Object.assign(cookie, { url })
        session.cookies.set(cookieValue, function (err) {
          if (err) {
            reject(err)
          } else {
            resolve()
          }
        })
      })
    }))
  }
}
