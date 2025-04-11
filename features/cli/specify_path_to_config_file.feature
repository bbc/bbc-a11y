Feature: Specify path to config file

  Scenario: Config file in alternative location
    Given a website running on a11ytests.com
    And a file named "path/to/a11y.js" with:
      """
      page('https://a11ytests.com/perfect')
      """
    When I run `bbc-a11y --config path/to/a11y.js`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/perfect
      """
