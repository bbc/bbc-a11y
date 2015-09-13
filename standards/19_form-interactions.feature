@manual
Feature: Use of form elements

Scenario: Check that form elements are used correctly

  Given the page has form element
  Then all the form element should take user input
  And form elements should not update location of the page when state changed
  And it should have submit button with clear call to action
