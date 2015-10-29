Feature: Display failing result

  Scenario:
    Given a website running at http://localhost:54321
    When I run `a11y http://localhost:54321/missing_header.html`
    Then it should fail with exactly:
      """
      ✗ http://localhost:54321/missing_header.html
        - A document must have exactly one heading. Found 0 h1 elements.
      """
