/* eslint-env mocha */
var sections = require('../lib/standards/sections')
var assert = require('assert')

describe('Standards.sections', function () {
  it('has a unique documentationUrl for each section', function () {
    var urls = {}
    for (var name in sections) {
      var section = sections[name]
      assert.equal(typeof section.documentationUrl, 'string')
      if (urls[section.documentationUrl]) assert.fail('duplicate: ' + section.documentationUrl)
      urls[section.documentationUrl] = true
    }
  })
})
