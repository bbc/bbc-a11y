Feature: Missing configuration file warning

  Scenario: Running the tool with no arguments and no config file
    When I run `a11y`
    Then it should fail with:
      """
      Missing configuration file (a11y.rb).

      Please visit http://www.rubydoc.info/gems/bbc-a11y for more information.
      """
