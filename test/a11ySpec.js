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
    return a11y.test({ skip: ['Main landmark: Exactly one Main landmark'] })
      .then(function (outcome) {
        expect(outcome.skipped).to.eql([
          {
            section: 'Main landmark',
            name: 'Exactly one Main landmark'
          }
        ])
      })
  })

  it('hides errors', function () {
    return a11y.test({ hide: ['Found 0 elements with role="main".'] })
      .then(function (outcome) {
        var resultsWithErrors = outcome.results.filter(function (standardResult) {
          return standardResult.hiddenErrors.length > 0
        })
        expect(resultsWithErrors[0].errors).to.eql([])
        expect(resultsWithErrors[0].hiddenErrors).to.eql([['Found 0 elements with role="main".']])
      })
  })

  it('only runs specific standards', function () {
    return a11y.test({ only: ['Main landmark: Exactly one Main landmark'] })
      .then(function (outcome) {
        expect(outcome.results.length).to.equal(1)
        expect(outcome.results[0].standard.name).to.equal('Exactly one Main landmark')
      })
  })
})
