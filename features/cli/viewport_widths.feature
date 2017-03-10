Feature: Viewport Widths

  Scenario: Pages may be invalid at a specific viewport width
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect_when_666_wide.html`
    And it should fail with:
      """
      Found 0 h1 elements
      """

  Scenario: Overriding the default viewport width from the command line
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect_when_666_wide.html --width 666`
    And it should pass with:
      """
      ✓ http://localhost:54321/perfect_when_666_wide.html --width 666
      """

  Scenario: Specifying viewport width in a configuration file
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect_when_666_wide.html", {
        width: 666
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ http://localhost:54321/perfect_when_666_wide.html --width 666
      """

  Scenario: Viewport is restored to default width when is specified then not specified
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect_when_666_wide.html", {
        width: 666
      })
      page("http://localhost:54321/perfect_when_666_wide.html")
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      ✓ http://localhost:54321/perfect_when_666_wide.html --width 666
      
      ✗ http://localhost:54321/perfect_when_666_wide.html
      """
