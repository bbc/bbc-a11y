Feature: Labelling form controls

  All form controls must be labelled.

  Labels help all users to understand what a form control is and what is being
  asked for. And they are essential for users who cannot easily determine this
  by looking at the form and surrounding content.

  All form controls, such as text inputs, check boxes, select lists, or buttons,
  must each have a unique label. The label can be either a default value of the
  control, such as a submit button, or a correctly associated property or
  element, such as a label. While placeholders may provide additional hints,
  they are temporary and must not substitute a label. Labels must be visible and
  available to assistive technology.

  Background:
    Given I am performing a manual test of the "Forms: Labelling form controls: All form controls must be labelled" standard
    And I have been asked "Are all form controls labelled?"

  Scenario: All form controls labelled (manual pass)
    When I answer "Yes"
    Then the manual test passes

  Scenario: Some form controls not labelled (manual fail)
    When I answer "No"
    Then the manual test fails
