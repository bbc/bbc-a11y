Feature: Ignore x-frame-options header

  Scenario: Page sets x-frame-options=SAMEORIGIN
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/x-frame-options`
    Then it passes
