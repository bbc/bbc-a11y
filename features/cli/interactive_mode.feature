Feature: Interactive Mode

  Scenario: Running a11y interactively
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/perfect --interactive`
    And the window should remain open
