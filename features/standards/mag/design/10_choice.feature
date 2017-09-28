Feature: Choice

  Interfaces must provide multiple ways to interact with content.

  Providing multiple ways to interact with content gives users choice and
  increases inclusivity. This supports different user expectations on how to
  interact with elements, and users who have difficulty with one type of
  interaction can use another.

  Some elements provide multiple types of interaction. For example, a button
  element can be navigated to via mouse, touch, keyboard, or switch device, and
  then clicked, tapped or otherwise activated. Swipe gestures, which only cover
  touch interaction, must be supported by alternatives that perform the same
  actions. Additionally custom controls must be consistent with similar native
  controls, providing multiple ways to interact with them to cover all types of
  user interaction.

  Avoid describing gestures in an alternative, tooltip, or hint, as the gesture
  or action might be different for users with assistive technology enabled.

  Background:
    Given I am performing a manual test of the "Design: Choice: Interfaces must provide multiple ways to interact with content" standard
    And I have been asked "Does the interface provide multiple ways to interact with the content?"

  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails
