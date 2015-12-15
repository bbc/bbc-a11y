Feature: Main landmark

  Scenario: Check for a single main element
    When I visit the page
    Then there should be exactly one element with `role="main"`
