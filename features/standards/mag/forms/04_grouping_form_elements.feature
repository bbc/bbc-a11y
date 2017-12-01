Feature: Grouping form elements

  Controls, labels, and other form elements must be properly grouped.

  Properly grouped form elements help all users understand the relationships
  between form controls and make forms easier to use. For users of assistive
  technology this can mean fewer steps and reduced complexity.

  Correctly grouped controls also ensure standard behaviours work as expected.

  There are four things to consider when grouping form elements:

  * correctly associating labels with form controls,
  * correctly associating related radio buttons or checkboxes,
  * wrapping related form elements in a labelled container such as fieldset with
    legend,
  * keeping labels and legends succinct to minimise verbosity.

  Background:
    Given I am performing a manual test of the "Forms: Grouping form elements: Controls, labels, and other form elements must be properly grouped" standard
    And I have been asked "Are controls, labels, and other form elements properly grouped?"

  @html @manual
  Scenario: Controls, labels, and other form elements properly grouped (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Controls, labels, and other form elements improperly grouped (manual fail)
    When I answer "No"
    Then the manual test fails
