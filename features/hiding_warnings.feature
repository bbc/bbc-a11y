Feature: Hiding warnings

  Things like ORB and Barlesque that we don't control will clutter up our pages
  with warnings.

  We need a way to ignore these kinds of problems, so we can focus on the
  problems that we can actually fix.

  Scenario: Hide warnings matching a selector
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/one_warning.html", {
        hide: "@id='main'"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/one_warning.html

      1 page checked, 0 errors found, 0 warnings, 1 warning hidden, 0 standards skipped
      """

  Scenario: Hide warnings matching a rule
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/one_warning.html", {
        hide: "First heading was not a main heading"
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/one_warning.html

      1 page checked, 0 errors found, 0 warnings, 1 warning hidden, 0 standards skipped
      """
