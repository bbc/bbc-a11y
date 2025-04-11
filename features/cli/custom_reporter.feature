Feature: Custom Reporter
  Scenario: Overriding the default output format with a JavaScript module
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/perfect")
      page("https://a11ytests.com/missing_main_heading")
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
      CHECKED https://a11ytests.com/perfect
      CHECKED https://a11ytests.com/missing_main_heading
      ENDED

      """
