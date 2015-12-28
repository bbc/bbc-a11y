Feature: Display failing result

  Scenario: One standard fails
    Given a website running at http://localhost:54321
    When I run `a11y http://localhost:54321/missing_header.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/missing_header.html
        - Found 0 h1 elements.
      """
