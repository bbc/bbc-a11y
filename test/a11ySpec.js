var a11y = require('../lib/a11y.js')
var expect = require('chai').expect
var $ = require('jquery')

describe('a11y', function() {
  beforeEach(function() {
    $('body').html('')
  })

  it('tests the DOM', function() {
    var outcome = a11y.test()
    var errors = outcome.results.filter(function(standardResult) {
      return standardResult.errors.length > 0
    }).map(function(standardResult) {
      standardResult.standard.section = standardResult.standard.section.title
      standardResult.errors = standardResult.errors.map(function(error) {
        return error.map(function(segment) {
          return segment.xpath ? segment.xpath : segment
        })
      })
      return standardResult
    })
    var expectedErrors = [
      {
        "standard": {
          "section": "Headings",
          "name": "Exactly one main heading"
        },
        "errors":[
          ["Found 0 h1 elements."]
        ],
        "warnings": [],
        "hiddenErrors": []
      },
      {
        "standard": {
          "section": "Indicating language",
          "name": "Html must have lang attribute"
        },
        "errors":[
          ["html tag has no lang attribute:","/html"]
        ],
        "warnings": [],
        "hiddenErrors": []
      },
      {
        "standard": {
          "section": "Main landmark",
          "name": "Exactly one Main landmark"
        },
        "errors":[
          ['Found 0 elements with role="main".']
        ],
        "warnings": [],
        "hiddenErrors": []
      }
    ]
    expect(JSON.stringify(errors)).to.equal(JSON.stringify(expectedErrors))
  })

  it('skips standards', function() {
    var result = a11y.test({ skip: ['Main landmark: Exactly one Main landmark'] })
    expect(result.skipped).to.eql([
      {
        section: 'Main landmark',
        name: 'Exactly one Main landmark'
      }
    ])
  })

  it('hides errors', function() {
    var outcome = a11y.test({ hide: ['Found 0 elements with role="main".'] })
    var resultsWithErrors = outcome.results.filter(function(standardResult) {
      return standardResult.hiddenErrors.length > 0
    })
    expect(resultsWithErrors[0].errors).to.eql([])
    expect(resultsWithErrors[0].hiddenErrors).to.eql([['Found 0 elements with role="main".']])
  })

  it('only runs specific standards', function() {
    var outcome = a11y.test({ only: ['Main landmark: Exactly one Main landmark'] })
    expect(outcome.results.length).to.equal(1)
    expect(outcome.results[0].standard.name).to.equal('Exactly one Main landmark')
  })
})
