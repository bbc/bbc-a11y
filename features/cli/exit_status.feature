Feature: Exit status

  For CI, we need to make sure the process exits with a non-zero
  status when there's been a failure.

  Scenario: Passing tests
    When all the tests pass
    Then the exit status should be 0

  Scenario: Failing test
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/missing_main_heading`
    Then the exit status should be 1
