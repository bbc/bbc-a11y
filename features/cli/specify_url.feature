Feature: Specify URL

  Scenario: No config, just pass page URL on command-line
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/perfect`
    Then it should pass with:
      """
      ✓ https://a11ytests.com/perfect
      """
