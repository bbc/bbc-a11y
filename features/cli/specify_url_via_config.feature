Feature: Specify URL via config

  Scenario: Specify a single page
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page('http://localhost:54321/perfect.html')
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/perfect.html
      """
