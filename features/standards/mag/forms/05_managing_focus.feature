Feature: Managing focus

  Focus or context must not automatically change during user input.

  It can be disorienting and hinder users from verifying information or
  correcting mistakes if the focus automatically changes when the user is not
  expecting it. For example, moving to the next control or to a validation error
  message during input.

  Focus must only change when activated by the user. This could be via mouse or
  touch, using 'tab' or 'flicking' to change form control, or using 'space' or
  'enter' to activate a button.

  Background:
    Given I am performing a manual test of the "Forms: Managing focus: Focus or context must not automatically change during user input" standard
    And I have been asked "Does focus or context automatically change during user input?"

  Scenario: Focus or context does not automatically change during user input (manual pass)
    When I answer "No"
    Then the manual test passes

  Scenario: Focus or context changes automatically during user input (manual fail)
    When I answer "Yes"
    Then the manual test fails
