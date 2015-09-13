Feature: Correctly use headings

  Scenario: Check headings
    When I visit the page
    Then there must be exactly one h1 element
    And each heading must be followed by content or a heading of one level deeper (h2-h6)
