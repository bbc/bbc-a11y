Feature: Ignore x-frame-options header

  Scenario: Page sets x-frame-options=SAMEORIGIN
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/x-frame-options.html`
    Then it passes
