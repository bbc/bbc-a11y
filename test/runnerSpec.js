/* eslint-env mocha */
const Runner = require('../lib/runner')
const Reporter = require('../lib/reporters/json')
const assert = require('assert')
const path = require('path')

describe('Runner', function () {
  let mainFrame, events

  beforeEach(function () {
    events = []

    mainFrame = document.createElement('iframe')
    mainFrame.id = 'mainFrame'
    document.body.appendChild(mainFrame)
  })

  function run (pages, configPath) {
    const devToolsConsole = {
      log: function () {
        events.push({ type: 'devToolsConsole.log', args: [].slice.apply(arguments) })
      },
      error: function () {
        events.push({ type: 'devToolsConsole.error', args: [].slice.apply(arguments) })
      },
      warn: function () {
        events.push({ type: 'devToolsConsole.warn', args: [].slice.apply(arguments) })
      }
    }
    const commandLineConsole = {
      log: function () {
        events.push({ type: 'commandLineConsole.log', args: [].slice.apply(arguments) })
      },
      error: function () {
        events.push({ type: 'commandLineConsole.error', args: [].slice.apply(arguments) })
      },
      warn: function () {
        events.push({ type: 'commandLineConsole.warn', args: [].slice.apply(arguments) })
      }
    }
    function exit () {
      events.push({ type: 'exit', args: [].slice.apply(arguments) })
    }

    const windowAdapter = {
      getContentSize () {
        return {
          width: Number(mainFrame.getAttribute('width') || 0),
          height: Number(mainFrame.getAttribute('height') || 0)
        }
      },

      setContentSize (width, height) {
        mainFrame.setAttribute('width', width)
        mainFrame.setAttribute('height', height)
      },

      measureInnerWidth () {
        return this.getContentSize().width
      }
    }

    return new Runner({
      configPath,
      runManualTests: false,
      pages,
      windowAdapter,
      reporter: new Reporter(devToolsConsole, commandLineConsole),
      exit
    })
      .run()
      .then(function () {
        return Promise.resolve(events)
      })
  }

  context('with a single a page as an argument', function () {
    it('checks the URL', function () {
      return run([{ url: 'https://example.com/' }])
        .then(function (events) {
          const firstEventPayload = JSON.parse(events[0].args[0])
          assert.deepEqual(firstEventPayload.pagesChecked, 1)
          assert.deepEqual(events[events.length - 1], { type: 'exit', args: [1] })
        })
    }).timeout(10000)
  })

  context('with no arguments', function () {
    it('loads the config file', function () {
      const configPath = path.join(__dirname, 'runnerSpec', 'a11y.js')
      return run([], configPath)
        .then(function (events) {
          const firstEventPayload = JSON.parse(events[0].args[0])
          assert.deepEqual(firstEventPayload.pagesChecked, 2)
          assert.deepEqual(events[events.length - 1], { type: 'exit', args: [1] })
        })
    }).timeout(10000)
  })
})
