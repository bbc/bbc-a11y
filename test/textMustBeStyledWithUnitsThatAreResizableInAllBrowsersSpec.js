/* eslint-env mocha */
var standard = require('../lib/standards/tests/textMustBeStyledWithUnitsThatAreResizableInAllBrowsers')
var $ = require('jquery')
var expect = require('chai').expect

beforeEach(function() {
  $('body').html('')
  $('style').remove()
})

describe('Font size units standard', function () {
  it('ignores empty text nodes', function () {
    $('<div style="font-size: 12px"></div>').appendTo('body')
    var failures = []
    var fail = function (failure, element) {
      failures.push(failure)
    }
    standard.test({ $, fail })
    expect(failures).to.eql([])
  })

  it('ignores comment nodes', function () {
    $('<div style="font-size: 12px"><!-- this is a comment --></div>').appendTo('body')
    var failures = []
    var fail = function (failure) {
      failures.push(failure)
    }
    standard.test({ $, fail })
    expect(failures).to.eql([])
  })

  it('ignores hidden nodes', function () {
    $('<div style="font-size: 12px; display: none">Lorem Ipsum</div>').appendTo('body')
    var failures = []
    var fail = function (failure) {
      failures.push(failure)
    }
    standard.test({ $, fail })
    expect(failures).to.eql([])
  })

  it('allows nodes sized with em units', function () {
    $('<div style="font-size: 1em">Lorem Ipsum</div>').appendTo('body')
    var failures = []
    var fail = function (failure) {
      failures.push(failure)
    }
    standard.test({ $, fail })
    expect(failures).to.eql([])
  })

  it('fails on visible nodes sized with px units using inline styles', function () {
    $('<div class="text" style="font-size: 12px">Lorem Ipsum</div>').appendTo('body')
    var failures = []
    var fail = function (failure, element) {
      failures.push([failure, element])
    }
    standard.test({ $, fail })
    expect(failures.length).to.eql(1)
    expect(failures[0][0]).to.eq('Text styled with px unit:')
    expect(failures[0][1][0]).to.eq($('.text')[0])
  })

  it('fails on visible nodes sized with px units using stylesheets', function () {
    $('<style>.text { font-size: 14px; }</style>').appendTo('head')
    $('<div class="text">Lorem Ipsum</div>').appendTo('body')
    var failures = []
    var fail = function (failure, element) {
      failures.push([failure, element])
    }
    standard.test({ $, fail })
    expect(failures.length).to.eql(1)
    expect(failures[0][0]).to.eq('Text styled with px unit:')
    expect(failures[0][1][0]).to.eq($('.text')[0])
  })

  it('works with CSS3 selectors', function () {
    $('<style>.text:not(:disabled):not(.disabled):active:focus { font-size: 12px; }</style>').appendTo('head')
    $('<div class="text"><a>Lorem Ipsum</a></div>').appendTo('body')
    var failures = []
    var fail = function (failure, element) {
      failures.push([failure, element])
    }
    standard.test({ $, fail })
    expect(failures.length).to.eql(0)
  })
})
