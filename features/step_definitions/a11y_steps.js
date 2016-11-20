var assert = require('assert')
var Standards = require('../../lib/bbc/a11y/js/standards')
var jquery = require('jquery')

module.exports = function() {
  this.Given(/^a website running at http:\/\/localhost:(\d+)$/, function(port, callback) {
    console.log("start web server")
    callback()
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

  this.Then(/^it fails with the message:$/, function (message) {
    var actualMessage = this.validationResult.results.filter(function(result) {
      return result.errors.length > 0
    }).map(function(err) {
      return err.errors.map(function(e) { return e.join(" ") }).join("\n");
    }).join("\n")
    assert.equal(message, actualMessage)
  })

  this.After(function(scenario) {
    if (!scenario.isFailed() && this.pageFrame) this.pageFrame.style.display = 'none'
  })
}
