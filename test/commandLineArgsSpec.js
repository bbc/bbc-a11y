/* eslint-env mocha */
var commandLineArgs = require('../lib/commandLineArgs')
var assert = require('assert')

describe('commandLineArgs.parse(argv)', function () {
  it('parses --width integer as viewport width', function () {
    const args = commandLineArgs.parse(['node', 'bbc-a11y', '--width', '777'])
    assert.equal(777, args.width)
  })

  it('parses --interactive as a boolean', function () {
    const args = commandLineArgs.parse(['node', 'bbc-a11y', '--interactive'])
    assert.equal(true, args.interactive)
  })

  it('parses --config as a string', function () {
    const args = commandLineArgs.parse(['node', 'bbc-a11y', '--config', 'foo'])
    assert.equal('foo', args.configPath)
  })

  it('parses all other arguments as URLs', function () {
    const args = commandLineArgs.parse(['node', 'bbc-a11y', 'foo', 'bar'])
    assert.deepEqual(['foo', 'bar'], args.urls)
  })
})
