/* eslint-env mocha */
var a11y = require('../lib/a11y.js')
var expect = require('chai').expect
var $ = require('jquery')

describe('a11y', function () {
  beforeEach(function () {
    $('body').html('')
  })

  it('tests the DOM', function () {
    $('html').attr('lang', 'en-gb')
    $('body').append('<div role="main"><h1>Hello!</h1><p>Some content</p></div>')
    return a11y.test().then(function (outcome) {
      var flattened = outcome.flatten()
      expect(flattened.errorsFound).to.equal(0)
    })
  })

  it('skips standards', function () {
    return a11y.test({ skip: ['Structure: Containers and landmarks: Exactly one main landmark'] })
      .then(function (outcome) {
        expect(outcome.skipped).to.eql([
          {
            section: 'Structure: Containers and landmarks',
            name: 'Exactly one main landmark'
          }
        ])
      })
  })

  it('hides errors', function () {
    return a11y.test({ hide: ['Found 0 main elements (main or with role="main").'] })
      .then(function (outcome) {
        var resultsWithErrors = outcome.results.filter(function (standardResult) {
          return standardResult.hiddenErrors.length > 0
        })
        expect(resultsWithErrors[0].errors).to.eql([])
        expect(resultsWithErrors[0].hiddenErrors).to.eql([['Found 0 main elements (main or with role="main").']])
      })
  })

  it('hides warnings', function () {
    $('body').append('<h2>I am in the wrong place</h2><h1>Hello!</h1>')
    return a11y.test({ hide: ['First heading was not a main heading'] })
      .then(function (outcome) {
        var resultsWithWarnings = outcome.results.filter(function (standardResult) {
          return standardResult.hiddenWarnings.length > 0
        })
        expect(resultsWithWarnings[0].warnings).to.eql([])
        expect(resultsWithWarnings[0].hiddenWarnings[0][0]).to.eql('First heading was not a main heading:')
      })
  })

  it('only runs specific standards', function () {
    return a11y.test({ only: ['Structure: Containers and landmarks: Exactly one main landmark'] })
      .then(function (outcome) {
        expect(outcome.results.length).to.equal(1)
        expect(outcome.results[0].standard.name).to.equal('Exactly one main landmark')
      })
  })
})
