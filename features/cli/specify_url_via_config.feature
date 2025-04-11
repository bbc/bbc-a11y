Feature: Specify URL via config

  Scenario: Specify a single page
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page('https://a11ytests.com/perfect')
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/perfect
      """
