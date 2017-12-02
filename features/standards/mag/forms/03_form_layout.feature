Feature: Form layout

  Labels must be placed close to the relevant form control, and laid out
  appropriately.

  Labelling form controls helps users to understand what is required. Keep
  labels close to the associated form control to prevent users becoming
  disoriented, particularly users who magnify or zoom in on content.

  Labels should precede associated controls, visually above or to the left of
  the input field. Labels for radio buttons and checkboxes visually work better
  to the right of the field, however, assistive technology such as screen
  readers must always speak the associated label before the input control.
  Labels for select lists may be included as the first item of the list itself.

  Background:
    Given I am performing a manual test of the "Forms: Form layout: Labels must be close and laid out appropriately" standard
    And I have been asked "Are labels placed close to the relevant form control, and laid out appropriately?"

  @html @manual
  Scenario: Labels are close and laid out appropriately (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Labels are not close or laid out inappropriately (manual fail)
    When I answer "No"
    Then the manual test fails
