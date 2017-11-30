Feature: Error messages and correction

  Clear error messages must be provided.

  Clear error messages help everyone to input and interact with content
  correctly. It is important to provide inclusive error messages that users of
  assistive technology can perceive. Keep in mind that not everyone sees visual
  cues, such as colour or icons. And people with cognitive impairments may have
  difficulty in understanding how to correct errors.

  When errors can be detected programmatically, provide clear informative
  messages that succinctly tell the user where the error is and suggestions,
  tips or instructions on how to correct it. Ensure it is easy for the user to
  return to the input/control that needs correcting, and other content.

  For example, on a form submission, a list of all fields needing correction
  could be added to an aria-live area above the form, with aria-invalid and
  inline visual cues to provide guidance. Be careful to avoid a keyboard trap
  and use ARIA or standard operating system notifications for users of assistive
  technology, such as screen readers.

  Background:
    Given I am performing a manual test of the "Notifications: Error messages and correction: Clear error messages must be provided" standard
    And I have been asked "Are clear error messages provided?"

  @html @manual
  Scenario: Clear error messages provided (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Unclear error messages provided (manual fail)
    When I answer "No"
    Then the manual test fails
