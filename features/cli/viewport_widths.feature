Feature: Viewport Widths

  Scenario: Overriding the default viewport width from the command line
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --width 666`
    Then it should run in a viewport 666 pixels wide
    And it should pass with:
      """
      ✓ http://localhost:54321/missing_header.html (width 666)
      """

  Scenario: Running one URL against multiple viewport widths
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/perfect.html --widths 777 888`
    Then it should pass with:
      """
      ✓ http://localhost:54321/perfect.html (width 777)
      ✓ http://localhost:54321/perfect.html (width 888)
      """

  Scenario: Specifying viewport widths in a configuration file
    Given a website running at http://localhost:54321
    And a file named "a11y.js" with:
      """
      page("http://localhost:54321/perfect.html", {
        widths: [555, 999]
      })
      """
    Then it should pass with:
      """
      ✓ http://localhost:54321/perfect.html (width 555)
      ✓ http://localhost:54321/perfect.html (width 999)
      """
