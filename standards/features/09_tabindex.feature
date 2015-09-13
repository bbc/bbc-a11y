Feature: Correctly use `tabindex` attributes

  Scenario: Check all tabindex values
    When I visit the page
    Then there should be no elements with a tabindex attribte of 1 or greater
    And there should be no elements with a tabindex attribute of 0 except for:
      | a        |
      | button   |
      | input    |
      | select   |
      | textarea |
