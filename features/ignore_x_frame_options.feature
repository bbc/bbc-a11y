Feature: Ignore x-frame-options header

  Scenario: Page sets x-frame-options=SAMEORIGIN
    Given a website running on localhost
    When I run `bbc-a11y http://localhost:54321/x-frame-options.html`
    Then it passes
