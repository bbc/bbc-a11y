Feature: Disabled Caching

  So that testers can make changes to their code and re-test, all caching
  must be disabled

  Scenario: Re-testing an updated page
    Given a website running on a11ytests.com
    When I run `bbc-a11y https://a11ytests.com/goodThenBad`
    Then it should pass with:
      """
      No errors found. But please remember:

      "Testing shows the presence, not the absence of bugs" -- Edsger W. Dijkstra

      I am only a robot. Always make time to perform manual testing using assistive
      technologies like VoiceOver, JAWS and NVDA to make sure you're providing a good
      user experience.
      """
    When I run `bbc-a11y https://a11ytests.com/goodThenBad?retest=true`
    Then it should fail with:
      """
      ✗ https://a11ytests.com/goodThenBad?retest=true
        * Structure: Headings: Exactly one main heading
          - Found 0 h1 elements.
      """
