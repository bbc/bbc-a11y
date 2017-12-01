Feature: Keyboard trap

  There must not be a keyboard trap.

  If using a keyboard or other non-pointer input, user focus must be allowed to
  progress and not become trapped. All focusable elements must be accessible.

  Any modal components that open from a user action should keep focus within the
  component and must provide a means to close or dismiss the component, which
  would return focus to the trigger element. For example, on-screen keyboards,
  information panels, or full-screen media.

  Any menu or drawer component that opens from a user action may follow the
  modal pattern, or may automatically close or dismiss the component and return
  focus to the trigger element after the user moves focus onward from the last
  element. For example, a drop-down menu, side-drawer menu, or accordion panel.

  Background:
    Given I am performing a manual test of the "Focus: Keyboard trap: There must not be a keyboard trap" standard
    And I have been asked "Is anything a keyboard trap?"

  @html @manual
  Scenario: No keyboard trap exists (manual pass)
    When I answer "No"
    Then the manual test passes

  @html @manual
  Scenario: Keyboard trap exists (manual fail)
    When I answer "Yes"
    Then the manual test fails
