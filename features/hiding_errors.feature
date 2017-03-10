Feature: Hiding errors

  Things like ORB and Barlesque that we don't control will clutter up our pages
  with violations.

  We need a way to ignore these kinds of problems, so we can focus on the
  problems that we can actually fix.

  Scenario: Hide errors matching a pattern
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/errors_in_orb_modules.html", {
        hide: "@id='orb-modules'"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/errors_in_orb_modules.html

      1 page checked, 0 errors found, 2 errors hidden, 0 warnings, 0 standards skipped
      """

  Scenario: Hide errors matching multiple patterns
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/errors_in_orb_modules.html", {
        hide: [
          "No content follows:",
          "Image has no alt attribute:"
        ]
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/errors_in_orb_modules.html

      1 page checked, 0 errors found, 2 errors hidden, 0 warnings, 0 standards skipped
      """
