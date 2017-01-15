Feature: Missing configuration file warning

  Scenario: Running the tool with no arguments and no config file
    When I run `bbc-a11y`
    Then it should fail with:
      """
      Missing configuration file (a11y.js).

      Please visit http://github.com/bbc/bbc-a11y for more information.
      """
