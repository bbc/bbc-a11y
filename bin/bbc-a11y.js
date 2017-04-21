#!/usr/bin/env node

var childProcess = require('child_process')
var path = require('path')

var electron = require('electron')

var args = [path.join(__dirname, '..', 'electron', 'bbc-a11y.js')].concat(process.argv.slice(2))

var child = childProcess.spawn(electron, args)
child.stdout.pipe(process.stdout)
process.stdin.pipe(child.stdin)

child.stderr.on('data', function (data) {
  var str = data.toString('utf8')
  // Silence Chromium/Electron noise
  if (str.match(/^\[\d+:\d+/) || str.match(/Electron Helper\[/)) return
  process.stderr.write(data)
})

child.on('close', function (code) {
  process.exit(code)
})

process.on('SIGINT', function () {
  child.kill('SIGINT')
  child.kill('SIGTERM')
})
