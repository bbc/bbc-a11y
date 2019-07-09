Feature: Input format

  A default input format must be indicated and supported.

  All users benefit from clearly indicated, well supported, form input formats,
  whether text, numbers, date, or a specific combination. It makes it easier to
  get it right first time and reduces errors when completing forms.

  The format required can be indicated as part of the label, set by correctly
  coding the input field, and assisted by providing the correct keyboard mode on
  devices that support it.

  Gesture based input, such as a slider or swipe-able select list, should also
  be clearly indicated. Any gestures must be implemented along with support for
  accessible alternatives, for example mobile keyboards.

  Background:
    Given I am performing a manual test of the "Forms: Input format: A default input format must be indicated and supported" standard
    And I have been asked "Is a default input format indicated/implied and supported?"

  @html @manual
  Scenario: A default input format is indicated and supported (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: A default input format is not indicated or supported (manual fail)
    When I answer "No"
    Then the manual test fails
