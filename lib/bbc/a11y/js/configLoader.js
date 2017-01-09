const configLoader = {
  load: function(pathToConfigModule) {
    const pages = []
    const hadPage = 'page' in global
    const oldPage = global.page
    global.page = (url, config = {}) => {
      const entry = { url }
      if (config.skip) entry.skip = [].concat(config.skip)
      if (config.only) entry.only = [].concat(config.only)
      pages.push(entry)
      return entry
    }
    let error
    try {
      require(pathToConfigModule)
    } catch (e) {
      error = e
    }
    if (hadPage)
      global.page = oldPage
    else
      delete global.page
    if (error)
      return Promise.reject(error)
    else
      return Promise.resolve({ pages })
  }
}

module.exports = configLoader
