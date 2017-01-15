Feature: Report configuration errors

  Scenario: Call an unknown keyword in the configuration file
    Given a file named "a11y.js" with:
      """
      page("one")
      page("two")
      paage("http://bad.com")
      page("three")
      page("four")
      """
    When I run `bbc-a11y`
    Then it should fail with exactly:
      """
      There was an error reading your configuration file at line 3 of 'a11y.js'

      paage is not defined

      For help learning the configuration DSL, please visit https://github.com/bbc/bbc-a11y

      """

    Scenario: Compilation error in configuration file
      Given a file named "a11y.js" with:
        """
        throw new Error("oops")
        """
      When I run `bbc-a11y`
      Then it should fail with exactly:
        """
        There was an error reading your configuration file at line 1 of 'a11y.js'

        oops

        For help learning the configuration DSL, please visit https://github.com/bbc/bbc-a11y

        """
