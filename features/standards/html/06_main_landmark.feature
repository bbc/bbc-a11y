Feature: Main landmark

  A page **must** have exactly one element with `role="main"`

  Rationale
  =========

  The WAI-ARIA `main` landmark role can be help keyboard users with assistive
  technologies such as screen readers (and in the future as native browser
  functionality) to skip directly to the main content of a page, bypassing
  navigation and other contents that might be before it.

  Scenario: Page has a single main element
    Given a page with the body:
      """
      <div role="main">Main element</div>
      """
    When I test the "Main landmark: Exactly one Main landmark" standard
    Then it passes

  Scenario: Page has two main elements
    Given a page with the body:
      """
      <div role="main">Main one</div>
      <div role="main">Main two</div>
      """
    When I test the "Main landmark: Exactly one Main landmark" standard
    Then it fails with the message:
      """
      Found 2 elements with role="main": /html/body/div[1] /html/body/div[2]
      """

  Scenario: Page has zero main elements
    Given a page with the body:
      """
      <div role="not-main">Main one</div>
      """
    When I test the "Main landmark: Exactly one Main landmark" standard
    Then it fails with the message:
      """
      Found 0 elements with role="main".
      """
