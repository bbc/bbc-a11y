Feature: Content order

  Content order must be logical.

  All users benefit when content is logically ordered, in particular users of
  assistive technology that follows the flow of the page or screen.

  Assistive technology such as screen readers will read through a page or
  screen in content order, regardless of the layout. However, expert users may
  jump between elements such as headings and move forward or backward from that
  point.

  Background:
    Given I am performing a manual test of the "Focus: Content order: Content order must be logical" standard
    And I have been asked "Is content logically ordered?"

  @html @manual
  Scenario: Logical content order (manual pass)
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Illogical content order (manual fail)
    When I answer "No"
    Then the manual test fails
