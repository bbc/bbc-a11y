Feature: Actionable elements

  Links and other actionable elements must be clearly distinguishable.

  All users must be able to determine if an element is actionable or if it is
  static content. Actionable elements are links, buttons, navigation and other
  control features, including swipe areas on touch devices that might be less
  obvious.

  Actionable elements must be identified visually, by convention, and by
  information provided to assistive technologies. This can be achieved using
  platform native elements such as links, buttons, inputs, etc. All elements
  should have clear labels and, when applicable, a suitable role or trait.

  Users should be able to control interfaces naturally and intuitively. Where
  realistic controls are used, such as toggle-buttons and sliders, users expect
  to interact with them in a literal and familiar way. In a game where the
  objective is to find an actionable element, it does not need to be obvious at
  the beginning of play but must be clearly distinguishable when it is located.

  Hover states should only act as confirmation that an element is actionable.

  Background:
    Given I am performing a manual test of the "Design: Actionable elements: Links must have underlines and pointers" standard
    And I have been asked "Do all links have underlines and pointers?"

  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails
