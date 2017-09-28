Feature: Standard operating system notifications

  Standard operating system notifications should be used where available and
  appropriate.

  Standard operating system (OS) methods for alerts and messages can often be
  more accessible than something custom made, in particular for users of
  assistive technology. This is because standard controls:

  * have traits that are understood by assistive technology such as screen
    readers,
  * generally appear in a consistent location, and
  * follow the user-defined options for font and colour.

  App level and browser level errors and alerts should use operating system
  methods of notification. However, page/screen or content level errors and
  alerts may use either OS or custom notifications. Custom notifications must be
  perceivable.

  Background:
    Given I am performing a manual test of the "Notifications: Standard operating system notifications: Prefer standard operating system notifications" standard
    And I have been asked "Are standard operating system notifications used where available and appropriate?"

  Scenario: Standard operating system notifications used (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  Scenario: Non-standard operating system notifications used (manual fail)
    When I answer "No"
    Then the manual test fails
