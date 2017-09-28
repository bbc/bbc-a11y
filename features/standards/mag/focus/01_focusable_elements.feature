Feature: Focusable elements

  All interactive elements must be focusable and non-interactive elements must
  not be focusable.

  Some people may only use a keyboard, switch device or voice control for
  navigation and input. For example, astronauts in space struggle to use a
  mouse, track pad, or touch screen because these require gravity.

  In order to operate an interactive element, a user must first be able to move
  focus to the element via any input device (keyboard, mouse, touch, voice,
  switch device etc.).

  Focus is defined differently depending on the platform. For example, iOS
  focus is limited to elements that support keyboard input and VoiceOver focus
  also requires accessibility to be enabled and proper frames defined.

  Background:
    Given I am performing a manual test of the "Focus: Focusable elements: Interactive elements must be focusable" standard
    And I have been asked "Are all interactive elements focusable?"

  Scenario: Interactive elements are focusable (manual pass)
    When I answer "Yes"
    Then the manual test passes

  Scenario: Not all interactive elements are focusable (manual fail)
    When I answer "No"
    Then the manual test fails
