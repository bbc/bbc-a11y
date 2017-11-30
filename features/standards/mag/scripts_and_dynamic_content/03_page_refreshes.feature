Feature: Page refreshes

  Automatic page refreshes must not be used without warning.

  Assistive technology, such as a screen reader, may lose its place in the
  content and announce the wrong information when an entire page reloads
  automatically. This can be confusing and disorienting for the user.

  Techniques that would trigger an entire page to be reloaded must not be used
  unless the user has been notified.

  Background:
    Given I am performing a manual test of the "Scripts and dynamic content: Page refreshes: Automatic page refreshes must not be used without warning" standard
    And I have been asked "Does the page refresh automatically without warning?"

  @html @manual
  Scenario: Page does not refresh automatically without warning (manual pass)
    When I answer "No"
    Then the manual test passes

  @html @manual
  Scenario: Page refreshes automatically without warning (manual fail)
    When I answer "Yes"
    Then the manual test fails
