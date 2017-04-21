const { defineSupportCode } = require('cucumber')

defineSupportCode(function ({ addTransform }) {
  addTransform({
    captureGroupRegexps: ['http:\\/\\/\\S+'],
    transformer: str => str,
    typeName: 'url'
  })
})
