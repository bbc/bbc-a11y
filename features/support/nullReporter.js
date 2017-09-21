module.exports = class NullReporter {
  runStarted () {
    this.results = []
  }

  unexpectedError (e) {
    console.log(e)
    throw e
  }

  pageChecked (page, results) {
    this.results[page.url] = results
  }

  runEnded () {
  }
}
