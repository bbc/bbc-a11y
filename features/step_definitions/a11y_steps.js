const { defineSupportCode } = require('cucumber')
var assert = require('assert')
var Standards = require('../../lib/standards')
var jquery = require('jquery')
var webServer = require('../support/web_server')

var console = require('electron').remote.getGlobal('console')

defineSupportCode(function({ Given, When, Then }) {

  Given('a website running at http:\/\/localhost:{port:int}', function(port) {
    return webServer.ensureRunningOn(Number(port))
  })

  Given('a file named {path:stringInDoubleQuotes} with:', function (path, contents) {
    require('fs').writeFileSync(this.tempDir + '/' + path, contents, 'utf-8')
  })

  Given('all the tests pass', function () {
    return webServer.ensureRunningOn(54321)
      .then(() => {
        return this.runA11y('http://localhost:54321/perfect.html')
      })
  })

  When('I run `bbc-a11y`', function () {
    return this.runA11y()
  })

  When('I run `bbc-a11y {url:url}`', function (url) {
    return this.runA11y(url)
  })

  When('I run `bbc-a11y {url:url} --interactive`', function (url) {
    return this.runA11yInteractively(url)
      .then(interactiveProcess => {
        this.interactiveProcess = interactiveProcess
      })
  })

  When('I run `bbc-a11y {url:url} --width {width:int}`', function (url, width) {
    return this.runA11y(`url --width ${width}`)
  })

  When('I run a11y against a failing page', function () {
    return webServer.ensureRunningOn(54321)
      .then(() => {
        return this.runA11y('http://localhost:54321/missing_main_heading.html')
      })
      .then(result => {
        this.stdout = result.stdout
        this.stderr = result.stderr
        this.exitCode = result.exitCode
      })
  })

  Given('a page with the HTML:', function (html) {
    this.pageFrame = document.createElement('iframe')
    document.body.appendChild(this.pageFrame)
    return new Promise((resolve, reject) => {
      this.pageFrame.addEventListener('load', function() {
        resolve()
      })
      this.pageFrame.srcdoc = html
    })
  })

  Given('a page with the body:', function (body) {
    this.pageFrame = document.createElement('iframe')
    document.body.appendChild(this.pageFrame)
    return new Promise((resolve, reject) => {
      this.pageFrame.addEventListener('load', function() {
        resolve()
      })
      this.pageFrame.srcdoc = '<html><body>' + body + '</body></html>'
    })
  })

  When('I validate the {name:stringInDoubleQuotes} standard', function (name) {
    var $ = jquery(this.pageFrame.contentDocument)
    var standards = Standards.matching(name)
    this.validationResult = standards.validate($.find.bind($))
  })

  Then('it passes', function () {
    var pass = !this.validationResult.results.find(function(result) {
      return result.errors.length > 0
    })
    assert(pass)
  })

  Then('it should fail with:', function (string) {
    var output = this.stdout + this.stderr
    assert(output.indexOf(string) > -1, "Expected:\n" + string + "\nActual:\n" + output)
  })

  Then('it should fail with exactly:', function (expectedOutput) {
    var actualOutput = (this.stdout + this.stderr)
    // HACK: work around stupid travis issue with xvfb
    var sanitisedActualOutput = actualOutput.split("\n").filter(line => line != 'Xlib:  extension "RANDR" missing on display ":99.0".').join("\n")
    assert.equal(sanitisedActualOutput, expectedOutput, "Expected:\n" + expectedOutput.replace(/\n/g, "[\\n]\n") + "\nActual:\n" + sanitisedActualOutput.replace(/\n/g, "[\\n]\n"))
  })

  Then('it should pass with:', function (string) {
    var output = this.stdout
    assert(output.indexOf(string) > -1, "Expected: " + string + "\nActual:   " + output)
  })

  Then('it fails with the message:', function (message) {
    var actualMessage = this.validationResult.results.filter(function(result) {
      return result.errors.length > 0
    }).map(function(err) {
      return err.errors.map(function(e) {
        return e.map(function(a) {
          return a.xpath ? a.xpath : a
        }).join(" ")
      }).join("\n");
    }).join("\n")
    assert.equal(message, actualMessage)
  })

  Then('the exit status should be {status:int}', function (status) {
    assert.equal(this.exitCode, status)
  })

  Then('the window should remain open', function () {
    return new Promise((resolve, reject) => {
      this.interactiveProcess.on('error', e => reject(e))
      this.interactiveProcess.on('close', (code, signal) => {
        resolve()
      })
      this.interactiveProcess.stdout.on('data', data => {
        if (data.toString().indexOf('Testing shows the presence, not the absence of bugs')) {
          setTimeout(() => reject(new Error("Failed to kill the process")), 100)
          this.interactiveProcess.kill('SIGINT')
        }
      })
    })
  })

  Then('it should run in a viewport {width:int} pixels wide', function (width) {
    assert.equal(width, electron.remote.getCurrentWindow().getContentSize()[0])
  })

})
