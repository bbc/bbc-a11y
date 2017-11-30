Feature: Consistency

  A user's experience should be consistent.

  Consistency allows all users to predict where to find information and how to
  use it. This is particularly helpful for users with cognitive impairments, in
  particular autistic users.

  Consistent and logical structure and language help all users understand where
  they are and how to navigate or perform a task. Consistent and logical layout
  helps both sighted and non-sighted users predict where they should touch or
  interact.

  For example, navigational aids such as back buttons should consistently move
  the user back to the previous step and act as a breadcrumb trail.

  The look and sound of a control, object or element should inform the user how
  to interact with it.

  For example, unless there is a recognised convention, such as for navigation,
  do not use links that are styled to look like buttons. This can be confusing
  for users of assistive technology, such as voice control or screen readers.

  Additionally, use common gestures alongside other controls for commonly used
  esign patterns:

  * swipe gestures for slideshows and carousels,
  * drag gestures for toggle and slider elements,
  * and, where available, support native inertia for scrolling.

  HTML Applicability
  ==================

  Forms must have a submit button and forms must not update the location of the
  page on change, focus, or blur events.

  Background:
    Given I am performing a manual test of the "Design: Consistency: User experience should be consistent" standard
    And I have been asked "Is the user experience consistent?"

  @html @manual
  Scenario: Manual pass
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail
    When I answer "No"
    Then the manual test fails
