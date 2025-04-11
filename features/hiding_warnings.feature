Feature: Hiding warnings

  Websites often contain external parts that we don't control, which will 
  clutter up our pages with violations.

  We need a way to ignore these kinds of problems, so we can focus on the
  problems that we can actually fix.

  Scenario: Hide warnings matching a selector
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/one_warning", {
        hide: "@id='main'"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/one_warning

      1 page checked, 0 errors found, 0 warnings, 1 warning hidden, 0 standards skipped
      """

  Scenario: Hide warnings matching a rule
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/one_warning", {
        hide: "First heading was not a main heading"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/one_warning

      1 page checked, 0 errors found, 0 warnings, 1 warning hidden, 0 standards skipped
      """
