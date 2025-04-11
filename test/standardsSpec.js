/* eslint-env mocha */
const Standards = require('../lib/standards')
const expect = require('chai').expect

describe('Standards', function () {
  describe('.matching(undefined)', function () {
    it('finds all standards', function () {
      const matches = Standards.matching()
      expect(matches.standards.length).to.equal(Standards.all.length)
    })
  })

  describe('.matching("Principles: Anchors must have hrefs")', function () {
    it('finds standards matching the string', function () {
      const matches = Standards.matching('Principles: Anchors must have hrefs')
      expect(matches.standards.length).to.equal(1)
    })
  })

  describe('.matching({ skip: ["Principles: Anchors must have hrefs"] })', function () {
    it('finds all standards except one', function () {
      const matches = Standards.matching({ skip: ['Principles: Anchors must have hrefs'] })
      expect(matches.standards.length).to.equal(Standards.all.length - 1)
    })
  })

  describe('.matching({ only: ["Principles: Anchors must have hrefs"] })', function () {
    it('finds one standard', function () {
      const matches = Standards.matching({ only: ['Principles: Anchors must have hrefs'] })
      expect(matches.standards.length).to.equal(1)
    })
  })
})
