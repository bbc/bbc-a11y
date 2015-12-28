Feature: Coloured Output
  To make console output easy to interpret
  Only terminals that support coloured output should show colours

  @keep-ansi-escape-sequences
  Scenario: TTY terminals show coloured output
    Given I am using a TTY terminal
    When I run a11y against a failing page
    Then I see red in the output

  @keep-ansi-escape-sequences
  Scenario: Non-TTY terminals show monochrome output
    Given I am using a Non-TTY terminal
    When I run a11y against a failing page
    Then I see monochrome output
