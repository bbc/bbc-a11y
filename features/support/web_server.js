var express = require('express')

module.exports = {
  appsByPort: {

  },

  ensureRunningOn: function(port) {
    if (this.appsByPort[port]) return Promise.resolve()
    var app = express()
    app.use(express.static(__dirname + '/web_server'))
    return new Promise(function(resolve, reject) {
      var listener = app.listen(port, function(err) {
        if (err)
          reject(err)
        else
          module.exports.appsByPort[port] = listener
          resolve()
      })
    });
  },

  stopAll: function() {
    var apps = this.appsByPort
    return Promise.all(Object.keys(apps).map(function(port) {
      return apps[port]
    }).map(function(app) {
      return new Promise(function(resolve, reject) {
        app.close(function(err) {
          resolve(err)
        })
      })
    }))
  }
}
