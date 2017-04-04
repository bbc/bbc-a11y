const express = require('express')
const fs = require('fs')
const path = require('path')

module.exports = {
  appsByPort: {},

  ensureRunningOn: function (port) {
    if (this.appsByPort[port]) return Promise.resolve()
    var app = express()
    let good = true
    app.get('/goodThenBad.html', (req, res) => {
      const page = good ? 'perfect.html' : 'missing_main_heading.html'
      good = !good
      res.set('Cache-Control', 'max-age=86400').status(200).end(fs.readFileSync(path.join(__dirname, 'web_server', page)))
    })
    app.get('/x-frame-options.html', (req, res) => {
      res.set('x-frame-options', 'SAMEORIGIN').status(200).end(fs.readFileSync(path.join(__dirname, 'web_server', 'perfect.html')))
    })
    app.use(express.static(path.join(__dirname, 'web_server')))
    return new Promise(function (resolve, reject) {
      var listener = app.listen(port, function (err) {
        if (err) { reject(err) } else { module.exports.appsByPort[port] = listener }
        resolve()
      })
    })
  },

  stopAll: function () {
    var apps = this.appsByPort
    return Promise.all(Object.keys(apps).map(function (port) {
      return apps[port]
    }).map(function (app) {
      return new Promise(function (resolve, reject) {
        app.close(function (err) {
          resolve(err)
        })
      })
    }))
  }
}
