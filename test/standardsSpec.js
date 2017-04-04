/* eslint-env mocha */
var Standards = require('../lib/standards')
var expect = require('chai').expect

describe('Standards', function () {
  describe('.matching(undefined)', function () {
    it('finds all standards', function () {
      var matches = Standards.matching()
      expect(matches.standards.length).to.equal(Standards.all.length)
    })
  })

  describe('.matching("Focusable controls: Anchors must have hrefs")', function () {
    it('finds standards matching the string', function () {
      var matches = Standards.matching('Focusable controls: Anchors must have hrefs')
      expect(matches.standards.length).to.equal(1)
    })
  })

  describe('.matching({ skip: ["Focusable controls: Anchors must have hrefs"] })', function () {
    it('finds all standards except one', function () {
      var matches = Standards.matching({ skip: ['Focusable controls: Anchors must have hrefs'] })
      expect(matches.standards.length).to.equal(Standards.all.length - 1)
    })
  })

  describe('.matching({ only: ["Focusable controls: Anchors must have hrefs"] })', function () {
    it('finds one standard', function () {
      var matches = Standards.matching({ only: ['Focusable controls: Anchors must have hrefs'] })
      expect(matches.standards.length).to.equal(1)
    })
  })
})
