var Runner = require('../lib/bbc/a11y/js/runner')
var Reporter = require('../lib/bbc/a11y/js/reporter')
var jquery = require('jquery')
var assert = require('assert')

describe('Runner', function() {
  var mainFrame, addressBar, events

  beforeEach(function() {
    events = []

    mainFrame = document.createElement('iframe')
    mainFrame.id = 'mainFrame'
    document.body.appendChild(mainFrame)

    addressBar = document.createElement('input')
    addressBar.id = 'addressBar'
    document.body.appendChild(addressBar)
  })

  function run(argv) {
    function loadUrl(url) {
      events.push({ type: 'loadUrl', url: url })
      return Promise.resolve(jquery(mainFrame).contents())
    }
    var devToolsConsole = {
      log: function() {
        events.push({ type: 'devToolsConsole.log', args: [].slice.apply(arguments) })
      },
      error: function() {
        events.push({ type: 'devToolsConsole.error', args: [].slice.apply(arguments) })
      }
    }
    var commandLineConsole = {
      log: function() {
        events.push({ type: 'commandLineConsole.log', args: [].slice.apply(arguments) })
      },
      error: function() {
        events.push({ type: 'commandLineConsole.error', args: [].slice.apply(arguments) })
      }
    }
    function exit() {
      events.push({ type: 'exit', args: [].slice.apply(arguments) })
    }

    return new Runner().run(argv, loadUrl, new Reporter(devToolsConsole, commandLineConsole), exit)
      .then(function() {
        return Promise.resolve(events)
      })
  }

  context('with a single a URL as an argument', function() {
    it('checks the URL', function() {
      return run(['http://some/url'])
        .then(function(events) {
          assert.deepEqual(events[0], { type: 'loadUrl', url: 'http://some/url' })
          assert.deepEqual(events[events.length - 1], { type: 'exit', args: [1] })
        })
    })
  })

  context('with no arguments', function() {
    it('loads the config file', function() {
      return run([])
        .then(function(events) {
          assert.deepEqual(events[0], { type: 'loadUrl', url: 'http://www.bbc.co.uk' })
          assert.deepEqual(events[events.length - 1], { type: 'exit', args: [1] })
        })
    })
  })
})
