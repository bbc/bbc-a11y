Feature: Tooltips and supplementary information

  Tooltips must not repeat link text or other alternatives.

  Not all users will see tooltips so they must not include essential
  information.

  Hints, titles and other tooltip-like text should provide additional
  explanatory content rather than repeat the main alternative for an element,
  object, or image. This prevents duplication of information for screen reader
  users.

  Background:
    Given I am performing a manual test of the "Text equivalents: Tooltips and supplementary information: Tooltips must not repeat link text or other alternatives" standard
    And I have been asked "Do tooltips repeat link text or other alternatives?"

  Scenario: Tooltips do not repeat link text or other alternatives (manual pass)
    When I answer "No (or not applicable)"
    Then the manual test passes

  Scenario: Tooltips repeat link text or other alternatives (manual fail)
    When I answer "Yes"
    Then the manual test fails
