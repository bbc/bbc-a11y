Feature: Viewport Widths

  Scenario: Pages may be invalid at a specific viewport width
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/perfect_when_666_wide`
    And it should fail with:
      """
      Found 0 h1 elements
      """

  Scenario: Overriding the default viewport width from the command line
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/perfect_when_666_wide --width 666`
    And it should pass with:
      """
      ✓ https://a11ytests.com/perfect_when_666_wide --width 666
      """

  Scenario: Specifying viewport width in a configuration file
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/perfect_when_666_wide", {
        width: 666
      })
      """
    When I run `bbc-a11y`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/perfect_when_666_wide --width 666
      """

  Scenario: Viewport is restored to default width when is specified then not specified
    Given a website running on a11ytests.com
    And a file named "a11y.js" with:
      """
      page("https://a11ytests.com/perfect_when_666_wide", {
        width: 666
      })
      page("https://a11ytests.com/perfect_when_666_wide")
      """
    When I run `bbc-a11y`
    Then it should fail with:
      """
      ✓ https://a11ytests.com/perfect_when_666_wide --width 666

      ✗ https://a11ytests.com/perfect_when_666_wide
      """
