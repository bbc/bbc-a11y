Feature: Specify path to config file

  Scenario: Config file in alternative location
    Given a website running at http://localhost:54321
    And a file named "path/to/a11y.js" with:
      """
      page('http://localhost:54321/perfect.html')
      """
    When I run `bbc-a11y --config path/to/a11y.js`
    Then it should pass with:
      """
      ✓ http://localhost:54321/perfect.html
      """
