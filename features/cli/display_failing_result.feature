Feature: Display failing result

  Scenario: One standard fails
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/missing_header.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/missing_header.html
        * Headings: Exactly one main heading
          - Found 0 h1 elements.
      """

  Scenario: Two standards fail
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/two_headings_failures.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/two_headings_failures.html
        * Headings: Content must follow headings
          - No content follows: /html/body/h2
        * Headings: Exactly one main heading
          - Found 0 h1 elements.
      """
