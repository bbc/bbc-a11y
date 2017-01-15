Feature: Specify URL

  Scenario: No config, just pass page URL on command-line
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html`
    Then it should pass with:
      """
      ✓ http://localhost:54321/perfect.html
      """
