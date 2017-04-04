Feature: Custom Reporter
  Scenario: Overriding the default output format with a JavaScript module
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html")
      page("http://localhost:54321/missing_main_heading.html")
      """
    And a file named "custom/reporter.js" with:
      """
      function Reporter(devToolsConsole, commandLineConsole) {
        this.console = commandLineConsole
      }

      Reporter.prototype.runStarted = function() {
        this.console.log("STARTED")
      }

      Reporter.prototype.pageChecked = function(page, pageResult) {
        this.console.log("CHECKED", page.url)
      }

      Reporter.prototype.runEnded = function() {
        this.console.log("ENDED")
      }

      Reporter.prototype.unexpectedError = function(error) {
        this.console.log("UNEXPECTED ERROR")
      }

      Reporter.prototype.configMissing = function() {
        this.console.log("CONFIG MISSING")
      }

      Reporter.prototype.configError = function(error) {
        this.console.log("CONFIG ERROR")
      }

      module.exports = Reporter
      """
    When I run `bbc-a11y --reporter custom/reporter.js`
    Then it should fail with exactly:
      """
      STARTED
      CHECKED http://localhost:54321/perfect.html
      CHECKED http://localhost:54321/missing_main_heading.html
      ENDED

      """
