const { defineParameterType } = require('cucumber')

defineParameterType({
  name: 'url',
  regexp: /http\S+/,
  transformer: str => str
})

defineParameterType({
  name: 'reporter',
  regexp: /(json|\S+\.js)/,
  transformer: str => str
})

defineParameterType({
  name: 'configPath',
  regexp: /\S+\.js/,
  transformer: str => str
})
