Feature: Grouped elements

  Controls, objects and grouped interface elements must be represented as a
  single accessible component.

  It is easier and quicker for people using a keyboard or screen reader to
  interact with content when not overwhelmed and confused by extraneous
  elements. Grouping elements into a single overall control makes things
  clearer, simplifies interactions, and can provide larger touch targets.

  For example, a control such as a custom item selector may be made up of
  smaller interface elements, but will be easier to use if conveyed as a single
  control. Another common example is grouping adjacent links to the same
  resource.

  Background:
    Given I am performing a manual test of the "Structure: Grouped elements: Grouped interface elements must be represented as a single component" standard
    And I have been asked "Are controls, objects and grouped interface elements represented as a single accessible component?"

  @html @manual
  Scenario: Controls, objects and grouped interface elements represented as a single accessible component (manual pass)
    When I answer "Yes (or not applicable)"
    Then the manual test passes

  @html @manual
  Scenario: Controls, objects and grouped interface elements not represented as a single accessible component (manual fail)
    When I answer "No"
    Then the manual test fails
