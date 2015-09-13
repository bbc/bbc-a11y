Feature: JavaScript

 @manual
  Scenario: View the page with JavaScript disabled
    When I view the page with JavaScript disabled
    Then all core content is available in the DOM
