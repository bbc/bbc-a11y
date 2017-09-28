Feature: Content resizing

  Users must be able to control font sizing and user interface (UI) scaling.

  All users benefit when they can adapt the size of content to see and read it.
  This may be a constant or temporary adaption due, for example, to screen size,
  screen glare, or vision impairment.

  Ensure that content responds to platform native text resizing, and that
  scaling (or "zoom") is supported.

  Users who magnify or zoom in on content only see part of the screen. Try to
  keep on-screen changes close to the point of interaction. For example, if a
  user completes an input field incorrectly add a visual cue above, below or
  inside the field, rather than out to the side.

  Scenario: Manual pass of "Content must be visible and usable with page zoomed to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the page zoomed to 200% of normal?"
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail of "Content must be visible and usable with page zoomed to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the page zoomed to 200% of normal?"
    When I answer "No"
    Then the manual test fails

  Scenario: Manual pass of "Content must be visible and usable with text resized to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with text resized to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the text resized to 200% of normal?"
    When I answer "Yes"
    Then the manual test passes

  Scenario: Manual fail of "Content must be visible and usable with text resized to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with text resized to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the text resized to 200% of normal?"
    When I answer "No"
    Then the manual test fails
