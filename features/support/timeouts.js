var {defineSupportCode} = require('cucumber')

defineSupportCode(function ({setDefaultTimeout}) {
  setDefaultTimeout(10000)
})
