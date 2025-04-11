#!/usr/bin/env node

const childProcess = require('child_process')
const path = require('path')

const electron = require('electron')

const args = [path.join(__dirname, '..', 'electron', 'bbc-a11y.js')].concat(process.argv.slice(2))

const child = childProcess.spawn(electron, args)
child.stdout.pipe(process.stdout)
process.stdin.pipe(child.stdin)

child.stderr.on('data', function (data) {
  const str = data.toString('utf8')
  // Silence Chromium/Electron noise
  if (str.match(/^\[\d+:\d+/) || str.match(/Electron Helper\[/) || str.match(/\*\*\* WARNING: Textured window/)) return
  process.stderr.write(data)
})

child.on('close', function (code) {
  process.exit(code)
})

process.on('SIGINT', function () {
  child.kill('SIGINT')
  child.kill('SIGTERM')
})
