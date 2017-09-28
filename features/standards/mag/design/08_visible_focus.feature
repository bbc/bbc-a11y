Feature: Visible focus

  When focused, all actionable and focusable elements must have a visible state
  change.

  Visible focus helps all users track where they are within the content. Sighted
  keyboard and switch device users track progress as they navigate focusable
  elements, similar to using a remote control with a TV interface. Touch users
  also receive confirmation that an element is interactive.

  Visible focus states happen when hover, focus or touch interactions occur. Do
  not depend on a browser's default visible states for hover, focus, or touch,
  as they may not work with the design. Do not inadvertently remove any default
  visible states for hover, focus, or touch unless providing an alternative. The
  visible focus state for all three interactions may look the same.

  Hover, focus and touch states should not be used to convey information that is
  not available elsewhere.

  Background:
    Given I am performing a manual test of the "Design: Visible focus: Focused elements must visibly change state" standard
    And I have been asked "Do all actionable and focusable elements visibly change state when focused?"

  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails
