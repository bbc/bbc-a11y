Feature: Skipping Standards

  Scenario: One standard is skipped
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/missing_main_heading", {
        skip: "Structure: Headings: Exactly one main heading"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/missing_main_heading
      """

  Scenario: All standards except one is skipped
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/two_headings_failures", {
        only: "Structure: Headings: Exactly one main heading"
      })
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      1 page checked, 1 error found, 0 warnings, [count all standards - 1] standards skipped
      """
