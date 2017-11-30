Feature: Feedback and assistance

  Non-critical feedback or assistance should be provided when appropriate.

  Occasional feedback and assistance can help people learn how to use something
  unfamiliar. It can be especially helpful for young children and people with
  cognitive impairments.

  When someone is not completing an objective correctly and/or does not progress
  multiple times, support and encouragement can motivate them to continue or
  keep trying. For example, in a game or other interactive content this could
  include hints, tips or the option to pass and move on to other content.

  Background:
    Given I am performing a manual test of the "Notifications: Feedback and assistance: Non-critical feedback or assistance should be provided when appropriate" standard
    And I have been asked "Is non-critical feedback or assistance provided when appropriate?"

  @html @manual
  Scenario: Non-critical feedback or assistance provided (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Non-critical feedback or assistance not provided (manual fail)
    When I answer "No"
    Then the manual test fails
