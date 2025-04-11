/* eslint-env mocha */
const assert = require('assert')
const sections = require('../lib/standards/sections')

describe('Standards.sections', function () {
  it('has a unique documentationUrl for each section', function () {
    const urls = {}
    for (const name in sections) {
      const section = sections[name]
      assert.equal(typeof section.documentationUrl, 'string')
      if (urls[section.documentationUrl]) assert.fail('duplicate: ' + section.documentationUrl)
      urls[section.documentationUrl] = true
    }
  })

  it('has a valid documentationUrl for each section (set TEST_DOCUMENTATION_URLS=true to run this test)', function () {
    if (process.env.TEST_DOCUMENTATION_URLS !== 'true') {
      return
    }
    this.timeout(60000)
    return Promise.all(Object.values(sections).map(section => {
      return fetch(section.documentationUrl)
        .then(response => {
          if (!response.ok) {
            throw new Error(`Invalid documentationUrl: ${section.documentationUrl}`)
          }
          return response.text()
        })
        .then(body => {
          if (body.indexOf('Not found') > -1) { throw new Error(`Invalid documentationUrl: ${section.documentationUrl}`) }
        })
    }))
  })
})
