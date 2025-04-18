Feature: Hiding errors

  Websites often contain external parts that we don't control, which will 
  clutter up our pages with violations.

  We need a way to ignore these kinds of problems, so we can focus on the
  problems that we can actually fix.

  Scenario: Hide errors matching a pattern
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/errors_in_orb_modules", {
        hide: "@id='orb-modules'"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/errors_in_orb_modules

      1 page checked, 0 errors found, 2 errors hidden, 0 warnings, 0 standards skipped
      """

  Scenario: Hide errors matching multiple patterns
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/errors_in_orb_modules", {
        hide: [
          "No content follows:",
          "Image has no alt attribute:"
        ]
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/errors_in_orb_modules

      1 page checked, 0 errors found, 2 errors hidden, 0 warnings, 0 standards skipped
      """
