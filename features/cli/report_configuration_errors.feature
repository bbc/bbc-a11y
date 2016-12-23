@config
Feature: Report configuration errors

  Scenario: Call an unknown keyword in the configuration file
    Given a file named ".a11y" with:
      """
      page "one"
      page "two"
      paage "http://bad.com"
      page "three"
      page "four"
      """
    When I run `a11y`
    Then it should fail with exactly:
      """
      There was an error reading your configuration file at line 3 of 'a11y.rb'

         page "two"
      => paage "http://bad.com"
         page "three"

      `paage` is not part of the configuration language

      For help learning the configuration DSL, please visit https://github.com/bbc/bbc-a11y

      """

    Scenario: Compilation error in configuration file
      Given a file named ".a11y" with:
        """
        1/0
        """
      When I run `a11y`
      Then it should fail with exactly:
        """
        There was an error reading your configuration file at line 1 of '.a11y'

        => 1/0

        divided by 0

        For help learning the configuration DSL, please visit https://github.com/bbc/bbc-a11y

        """
