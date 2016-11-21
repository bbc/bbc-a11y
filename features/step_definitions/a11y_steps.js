var assert = require('assert')
var mkdirp = require('mkdirp')
var rimraf = require('rimraf')
var Standards = require('../../lib/bbc/a11y/js/standards')
var jquery = require('jquery')
var webServer = require('../support/web_server')
var childProcess = require('child_process')
var path = require('path')

var tempDir = __dirname + '/tmp'

function runA11y(args) {
  return new Promise(function(resolve, reject) {
    const execFile = require('child_process').execFile
    const result = {}
    var child = execFile(path.resolve(__dirname, '../../bin/a11y.js'), (args && [args]) || [], { cwd: tempDir }, (error, stdout, stderr) => {
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

module.exports = function() {
  this.Given(/^a website running at http:\/\/localhost:(\d+)$/, function(port) {
    return webServer.ensureRunningOn(Number(port))
  })

  this.Given(/^a file named "([^"]*)" with:$/, function (path, contents) {
    require('fs').writeFileSync(tempDir + '/' + path, contents, 'utf-8')
  })

  this.Given(/^all the tests pass$/, function () {
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

  this.When(/^I run `a11y`$/, function () {
    var scenario = this
    return runA11y('')
      .then(function(result) {
        scenario.stdout = result.stdout
        scenario.stderr = result.stderr
        scenario.exitCode = result.exitCode
      })
  })

  this.When(/^I run `a11y (.+)`$/, function (url) {
    var scenario = this
    return runA11y(url)
      .then(function(result) {
        scenario.stdout = result.stdout
        scenario.stderr = result.stderr
        scenario.exitCode = result.exitCode
      })
  })

  this.When(/^I run a11y against a failing page$/, function () {
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

  this.Given(/^a page with the HTML:$/, function (html) {
    this.pageFrame = document.createElement('iframe')
    document.body.appendChild(this.pageFrame)
    this.pageFrame.contentWindow.document.write(html)
  })

  this.Given(/^a page with the body:$/, function (body) {
    this.pageFrame = document.createElement('iframe')
    document.body.appendChild(this.pageFrame)
    this.pageFrame.contentWindow.document.write('<html><body>' + body + '</body></html>')
  })

  this.When(/^I validate the "([^"]*)" standard$/, function (name) {
    var $ = jquery(this.pageFrame.contentDocument)
    var standards = Standards.matching(name)
    this.validationResult = standards.validate($.find.bind($))
  })

  this.Then(/^it passes$/, function () {
    var pass = !this.validationResult.results.find(function(result) {
      return result.errors.length > 0
    })
    assert(pass)
  })

  this.Then(/^it should fail with:$/, function (string) {
    var output = this.stderr + this.stdout
    assert(output.indexOf(string) > -1, "Expected:\n" + string + "\nActual:\n" + output)
  })

  this.Then(/^it should fail with exactly:$/, function (string) {
    var output = this.stderr + this.stdout
    assert.equal(string, output, "Expected:\n" + string + "\nActual:\n" + output)
  })

  this.Then(/^it should pass with:$/, function (string) {
    var output = this.stdout
    assert(output.indexOf(string) > -1, "Expected: " + string + "\nActual:   " + output)
  })

  this.Then(/^it fails with the message:$/, function (message) {
    var actualMessage = this.validationResult.results.filter(function(result) {
      return result.errors.length > 0
    }).map(function(err) {
      return err.errors.map(function(e) { return e.join(" ") }).join("\n");
    }).join("\n")
    assert.equal(message, actualMessage)
  })

  this.Then(/^the exit status should be (\d+)$/, function (status) {
    assert.equal(this.exitCode, status)
  });

  this.Before(function(scenario, callback) {
    childProcess.exec('rm -rf ' + tempDir, function(err, out) {
      mkdirp(tempDir, callback)
    });
  })

  this.After(function(scenario) {
    if (!scenario.isFailed() && this.pageFrame) this.pageFrame.style.display = 'none'
  })
}
