Feature: Timeouts

  A timed response must be adjustable.

  Some people may not be able to respond or interact before a time limit is
  reached. If a timeout is essential, allow users to extend, change or disable
  the time limit to ensure they can still access content, complete forms, and
  make choices at their own speed.

  For example, as appropriate for the content:

  * provide a means to adjust or disable a timing feature before starting an
    interaction,
  * warn the user of a timeout and provide a means to extend the time.
  * An exception may be made, with sought advice, for real-time content and
    content that would be invalidated by allowing more time, such as a quiz or
    vote.

  Background:
    Given I am performing a manual test of the "Scripts and dynamic content: Timeouts: Timed responses must be adjustable" standard
    And I have been asked "Are there any timed responses that are not adjustable?"

  Scenario: No nonadjustable timed responses (manual pass)
    When I answer "No"
    Then the manual test passes

  Scenario: Nonadjustable timed responses (manual fail)
    When I answer "Yes"
    Then the manual test fails
