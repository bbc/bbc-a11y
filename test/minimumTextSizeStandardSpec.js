/* eslint-env mocha */
var standard = require('../lib/standards/minimumTextSize/textCannotBeTooSmall')
var $ = require('jquery')
var expect = require('chai').expect

describe('Minimum text size standard', function () {
  it('ignores text nodes with parents with display: none', function () {
    $('<div style="display:none font-size: 1px">Text!</div>').appendTo('body')
    var failures = []
    var fail = function (failure) {
      failures.push(failure)
    }
    standard.test({ $, fail })
    expect(failures).to.eql([])
  })

  it('ignores comment nodes', function () {
    $('<div style="font-size: 1px"><!-- this is a comment --></div>').appendTo('body')
    var failures = []
    var fail = function (failure) {
      failures.push(failure)
    }
    standard.test({ $, fail })
    expect(failures).to.eql([])
  })

  it('only reports the parent element when a child element also has small fonts', function () {
    $('<div style="font-size: 1px"><span style="font-size: 2px">Text!</span></div>').appendTo('body')
    var failures = []
    var fail = function (failure) { failures.push(failure) }
    standard.test({ $, fail })
    expect(failures).to.eql(['Text size too small (2px):'])
  })
})
