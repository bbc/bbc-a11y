Feature: Inclusive notifications

  Notifications must be both visible and audible.

  All users benefit when notifications are communicated clearly and can be
  perceived in multiple ways. Some users may only perceive in one way, while
  others will benefit from a combination.

  Make notifications visible using standard operating system alerts, inline
  messages or icons. Make notifications audible using sound bites or ensuring
  they can be read by assistive technology. And, where possible, make
  notifications felt by using haptic feedback when appropriate to do so.

  Notifications inform and guide users. They can be error messages, alerts,
  instructions, changes of state, responding to an interaction or a range of
  other cues.

  Content elements change state when their meaning changes during interaction,
  for example, 'selected/not selected', 'add/added', or 'delete/deleted'.
  Populating an autosuggest, or similar dynamic area, would also be a change of
  state. Hover and focus states indicate an element is interactive. Icons and
  avatars are visual cues, and should have supporting audio cues (or "earcons")
  when appropriate.

  Background:
    Given I am performing a manual test of the "Notifications: Inclusive notifications: Notifications must be both visible and audible" standard
    And I have been asked "Are notifications both visible and audible (via assistive technology if needed)?"

  @html @manual
  Scenario: Notifications both visible and audible (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Notifications only visible or audible, but not both (manual fail)
    When I answer "No"
    Then the manual test fails
