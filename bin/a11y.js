#!/usr/bin/env node

var childProcess = require('child_process')
var path = require('path')

var electron = require('electron')

var args = [path.join(__dirname, '..', 'electron', 'a11y.electron')].concat(process.argv.slice(2))
var child = childProcess.spawn(electron, args, { stdio: 'inherit' })

child.on('close', function (code) {
  process.exit(code)
})
