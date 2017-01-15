const { defineSupportCode } = require('cucumber')
var assert = require('assert')
var mkdirp = require('mkdirp')
var rimraf = require('rimraf')
var Standards = require('../../lib/bbc/a11y/js/standards')
var jquery = require('jquery')
var webServer = require('../support/web_server')
var childProcess = require('child_process')
var path = require('path')
var console = require('electron').remote.getGlobal('console')

var tempDir = path.resolve(__dirname + '/../../tmp')

function runA11y(args) {
  return new Promise(function(resolve, reject) {
    const execFile = childProcess.execFile
    const result = {}
    var child = execFile(path.resolve(__dirname, '../../bin/bbc-a11y.js'), (args && [args]) || [], { cwd: tempDir }, (error, stdout, stderr) => {
      if (error) {
        result.error = error
      }
      result.stdout = stdout
      result.stderr = stderr
    });

    child.on('close', function (code) {
      result.exitCode = code
      resolve(result)
    })
  });
}

function runA11yInteractively(args) {
  return new Promise(function(resolve, reject) {
    const spawn = childProcess.spawn
    const splitArgs = args.split(' ').concat('--interactive')
    const interactiveProcess = spawn(path.resolve(__dirname, '../../bin/bbc-a11y.js'), splitArgs, { cwd: tempDir })
    setTimeout(() => { interactiveProcess.kill('SIGINT') }, 2000)
    resolve(interactiveProcess)
  })
}

defineSupportCode(function({ Given, When, Then, Before, After }) {

  Given(/^a website running at http:\/\/localhost:(\d+)$/, function(port) {
    return webServer.ensureRunningOn(Number(port))
  })

  Given(/^a file named "([^"]*)" with:$/, function (path, contents) {
    require('fs').writeFileSync(tempDir + '/' + path, contents, 'utf-8')
  })

  Given(/^all the tests pass$/, function () {
    var scenario = this
    return webServer.ensureRunningOn(54321)
      .then(function() {
        return runA11y('http://localhost:54321/perfect.html')
      })
      .then(function(result) {
        scenario.stdout = result.stdout
        scenario.stderr = result.stderr
        scenario.exitCode = result.exitCode
      })
  })

  When(/^I run `a11y`$/, function () {
    var scenario = this
    return runA11y('')
      .then(function(result) {
        scenario.stdout = result.stdout
        scenario.stderr = result.stderr
        scenario.exitCode = result.exitCode
      })
  })

  When(/^I run `a11y (http:[^\s]+)`$/, function (url) {
    var scenario = this
    return runA11y(url)
      .then(function(result) {
        scenario.stdout = result.stdout
        scenario.stderr = result.stderr
        scenario.exitCode = result.exitCode
      })
  })

  When(/^I run `a11y (http:[^\s]+) --interactive`$/, function (url) {
    return runA11yInteractively(url)
      .then(interactiveProcess => {
        this.interactiveProcess = interactiveProcess
      })
  })

  When(/^I run a11y against a failing page$/, function () {
    var scenario = this
    return webServer.ensureRunningOn(54321)
      .then(function() {
        return runA11y('http://localhost:54321/missing_header.html')
      })
      .then(function(result) {
        scenario.stdout = result.stdout
        scenario.stderr = result.stderr
        scenario.exitCode = result.exitCode
      })
  })

  Given(/^a page with the HTML:$/, function (html) {
    this.pageFrame = document.createElement('iframe')
    document.body.appendChild(this.pageFrame)
    return new Promise((resolve, reject) => {
      this.pageFrame.addEventListener('load', function() {
        resolve()
      })
      this.pageFrame.srcdoc = html
    })
  })

  Given(/^a page with the body:$/, function (body) {
    this.pageFrame = document.createElement('iframe')
    document.body.appendChild(this.pageFrame)
    return new Promise((resolve, reject) => {
      this.pageFrame.addEventListener('load', function() {
        resolve()
      })
      this.pageFrame.srcdoc = '<html><body>' + body + '</body></html>'
    })
  })

  When(/^I validate the "([^"]*)" standard$/, function (name) {
    var $ = jquery(this.pageFrame.contentDocument)
    var standards = Standards.matching(name)
    this.validationResult = standards.validate($.find.bind($))
  })

  Then(/^it passes$/, function () {
    var pass = !this.validationResult.results.find(function(result) {
      return result.errors.length > 0
    })
    assert(pass)
  })

  Then(/^it should fail with:$/, function (string) {
    var output = this.stdout + this.stderr
    assert(output.indexOf(string) > -1, "Expected:\n" + string + "\nActual:\n" + output)
  })

  Then(/^it should fail with exactly:$/, function (expectedOutput) {
    var actualOutput = (this.stdout + this.stderr)
    // HACK: work around stupid travis issue with xvfb
    var sanitisedActualOutput = actualOutput.split("\n").filter(line => line != 'Xlib:  extension "RANDR" missing on display ":99.0".').join("\n")
    assert.equal(sanitisedActualOutput, expectedOutput, "Expected:\n" + expectedOutput.replace(/\n/g, "[\\n]\n") + "\nActual:\n" + sanitisedActualOutput.replace(/\n/g, "[\\n]\n"))
  })

  Then(/^it should pass with:$/, function (string) {
    var output = this.stdout
    assert(output.indexOf(string) > -1, "Expected: " + string + "\nActual:   " + output)
  })

  Then(/^it fails with the message:$/, function (message) {
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

  Then(/^the exit status should be (\d+)$/, function (status) {
    assert.equal(this.exitCode, status)
  })

  When(/^the window should remain open$/, function () {
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

  Before(function(scenario, callback) {
    childProcess.exec('rm -rf ' + tempDir, function(err, out) {
      mkdirp(tempDir, callback)
    });
  })

  After(function(scenario) {
    if (!scenario.isFailed() && this.pageFrame) this.pageFrame.style.display = 'none'
  })

})
