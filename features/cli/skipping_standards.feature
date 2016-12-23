Feature: Skipping Standards

  @config
  Scenario: One standard is skipped
    Given a website running at http://localhost:54321
    And a file named ".a11y" with:
      """
      page http://localhost:54321/missing_header.html
      skip Headings: exactly one main heading
      """
    When I run `a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/missing_header.html
      """

  @config
  Scenario: All standards except one is skipped
    Given a website running at http://localhost:54321
    And a file named "a11y.rb" with:
      """
      page http://localhost:54321/two_headings_failures.html
      skip Headings: exactly one main heading
      """
    When I run `a11y`
    Then it should fail with:
      """
      1 page checked, 1 error found, 11 standards skipped
      """
