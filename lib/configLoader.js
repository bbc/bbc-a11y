const configLoader = {
  load: function (pathToConfigModule) {
    const pages = []
    const hadPage = 'page' in global
    const oldPage = global.page
    global.page = (url, config = {}) => {
      const page = { url }
      if (config.skip) page.skip = [].concat(config.skip)
      if (config.only) page.only = [].concat(config.only)
      if (config.width) page.width = config.width
      if (config.hide) page.hide = [].concat(config.hide)
      if (config.cookies) page.cookies = config.cookies
      if (config.visit) page.visit = config.visit
      if (config.w3cValidator) page.w3cValidator = config.w3cValidator
      pages.push(page)
      return page
    }
    let error
    try {
      require(pathToConfigModule)
    } catch (e) {
      error = e
    }
    if (hadPage) { global.page = oldPage } else { delete global.page }
    if (error) { return Promise.reject(error) } else { return Promise.resolve({ pages }) }
  }
}

module.exports = configLoader
