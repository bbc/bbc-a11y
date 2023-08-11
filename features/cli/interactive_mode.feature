Feature: Interactive Mode

  Scenario: Running a11y interactively
    Given a website running on localhost
    When I run `bbc-a11y http://localhost:54321/perfect.html --interactive`
    And the window should remain open
