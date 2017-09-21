const path = require('path')

module.exports = {
  createReporter ({ name, console, remoteConsole }) {
    let Reporter
    switch (name) {
      case 'json':
        Reporter = require(`./reporters/${name}`)
        break
      case 'pretty':
      case undefined:
        Reporter = require('./reporters/pretty')
        break
      default:
        Reporter = require(path.join(process.cwd(), name))
    }

    return new Reporter(console, remoteConsole)
  }
}
