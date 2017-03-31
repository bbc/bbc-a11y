var Runner = require('../lib/runner')
var Reporter = require('../lib/reporters/pretty')
var jquery = require('jquery')
var assert = require('assert')
const path = require('path')

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

  function run(pages, configPath) {
    function loadPage(page) {
      events.push({ type: 'loadPage', page })
      return Promise.resolve(jquery(mainFrame).contents())
    }
    var devToolsConsole = {
      log: function() {
        events.push({ type: 'devToolsConsole.log', args: [].slice.apply(arguments) })
      },
      error: function() {
        events.push({ type: 'devToolsConsole.error', args: [].slice.apply(arguments) })
      },
      warn: function() {
        events.push({ type: 'devToolsConsole.warn', args: [].slice.apply(arguments) })
      }
    }
    var commandLineConsole = {
      log: function() {
        events.push({ type: 'commandLineConsole.log', args: [].slice.apply(arguments) })
      },
      error: function() {
        events.push({ type: 'commandLineConsole.error', args: [].slice.apply(arguments) })
      },
      warn: function() {
        events.push({ type: 'commandLineConsole.warn', args: [].slice.apply(arguments) })
      }
    }
    function exit() {
      events.push({ type: 'exit', args: [].slice.apply(arguments) })
    }

    return new Runner(configPath).run(pages, loadPage, new Reporter(devToolsConsole, commandLineConsole), exit)
      .then(function() {
        return Promise.resolve(events)
      })
  }

  context('with a single a page as an argument', function() {
    it('checks the URL', function() {
      return run([{ url: 'http://some/url' }])
        .then(function(events) {
          assert.deepEqual(events[0], { type: 'loadPage', page: { url: 'http://some/url' } })
          assert.deepEqual(events[events.length - 1], { type: 'exit', args: [1] })
        })
    })
  })

  context('with no arguments', function() {
    it('loads the config file', function() {
      const configPath = path.join(__dirname, 'runnerSpec', 'a11y.js')
      return run([], configPath)
        .then(function(events) {
          assert.deepEqual(events[0], { type: 'loadPage', page: { url: 'http://www.bbc.co.uk/sport' } })
          assert.deepEqual(events[events.length - 1], { type: 'exit', args: [1] })
        })
    })
  })
})
