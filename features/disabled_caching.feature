Feature: Disabled Caching

  So that testers can make changes to their code and re-test, all caching
  must be disabled

  Scenario: Re-testing an updated page
    Given a website running at http://localhost:54321
    When I run `bbc-a11y http://localhost:54321/goodThenBad.html`
    Then it should pass with:
      """
      No errors found. But please remember:

      "Testing shows the presence, not the absence of bugs" -- Edsger W. Dijkstra

      I am only a robot. Always make time to perform manual testing using assistive
      technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good
      user experience.
      """
    When I run `bbc-a11y http://localhost:54321/goodThenBad.html`
    Then it should fail with:
      """
      ✗ http://localhost:54321/goodThenBad.html
        * Headings: Exactly one main heading
          - Found 0 h1 elements.
      """
