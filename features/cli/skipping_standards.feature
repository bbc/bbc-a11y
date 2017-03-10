Feature: Skipping Standards

  Scenario: One standard is skipped
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/missing_main_heading.html", {
        skip: "Headings: Exactly one main heading"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/missing_main_heading.html
      """

  Scenario: All standards except one is skipped
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/two_headings_failures.html", {
        only: "Headings: Exactly one main heading"
      })
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      1 page checked, 1 error found, 0 warnings, [count all standards - 1] standards skipped
      """
