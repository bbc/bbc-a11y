Feature: Input control

  Interaction input control should be adaptable.

  People with motor or other physical impairments may need to adapt the input
  control for interactive content, to best accommodate their abilities. For
  example, someone who is left-handed may prefer to use a pattern of control
  keys on the left of the keyboard that are within closer reach; and someone
  with developing or impaired fine motor skills would benefit from simpler
  controls that allow for less precise gestures.

  Adaption could be through user settings or automatic detection. Things to
  consider for adaption include:

  * the mapping of control keys,
  * the complexity of controls (such as offering both multi-button and
    one-button control modes),
  * the sensitivity and pace of reaction to input signals, and
  * the quantity, size and distance between targets or paths.

  Background:
    Given I am performing a manual test of the "Scripts and dynamic content: Input control: Interaction input control should be adaptable" standard
    And I have been asked "Is interaction input control adaptable?"

  Scenario: Interaction input control is adaptable (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  Scenario: Interaction input control is not adaptable (manual fail)
    When I answer "No"
    Then the manual test fails
